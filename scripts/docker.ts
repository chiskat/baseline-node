import { spawnSync } from 'node:child_process'
import { existsSync } from 'node:fs'
import { dirname, join, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'

export type DockerBuildOptions = {
  image: string
  dockerfile: string
  calver: string
  nodeVersion?: string
  npmVersion?: string
  pnpmVersion?: string
}

function runDocker(args: string[], options: { capture?: boolean } = {}): string {
  const result = spawnSync('docker', args, {
    encoding: 'utf8',
    stdio: options.capture ? ['ignore', 'pipe', 'pipe'] : 'inherit',
  })
  if (result.error) throw result.error
  if (result.status !== 0) {
    throw new Error(`docker ${args.join(' ')} 执行失败，退出码 ${result.status}`)
  }
  return result.stdout ?? ''
}

export function dockerManifestExists(image: string, tag: string): boolean {
  const result = spawnSync('docker', ['manifest', 'inspect', `${image}:${tag}`], {
    stdio: 'ignore',
  })
  return result.status === 0
}

export function dockerBuild({
  image,
  dockerfile,
  calver,
  nodeVersion,
  npmVersion,
  pnpmVersion,
}: DockerBuildOptions): void {
  const args = ['buildx', 'build', '--platform', 'linux/amd64,linux/arm64', '--progress', 'plain']
  if (nodeVersion) args.push('--build-arg', `NODE_VERSION=${nodeVersion}`)
  if (npmVersion) args.push('--build-arg', `NPM_VERSION=${npmVersion}`)
  if (pnpmVersion) args.push('--build-arg', `PNPM_VERSION=${pnpmVersion}`)
  args.push('-t', `chiskat/${image}:${calver}`, '-f', dockerfile, '--push', '.')
  runDocker(args)
}

export function dockerBuildPuppeteer(
  image: string,
  baseImage: string,
  dockerfile: string,
  calver: string
): void {
  runDocker([
    'buildx',
    'build',
    '--platform',
    'linux/amd64,linux/arm64',
    '--progress',
    'plain',
    '--build-arg',
    `BASE_IMAGE=${baseImage}`,
    '-t',
    `${image}:${calver}`,
    '-f',
    dockerfile,
    '--push',
    '.',
  ])
}

export function dockerPush(image: string, calver: string, versionTag?: string): void {
  if (versionTag)
    runDocker([
      'buildx',
      'imagetools',
      'create',
      '-t',
      `${image}:${versionTag}`,
      `${image}:${calver}`,
    ])
  runDocker(['buildx', 'imagetools', 'create', '-t', `${image}:latest`, `${image}:${calver}`])
}

export function dockerReadme(image: string, shortDescription: string, readmePath: string): void {
  runDocker([
    'run',
    '--rm',
    '-e',
    `PUSHRM_TARGET=docker.io/${image}`,
    '-e',
    `PUSHRM_SHORT=${shortDescription}`,
    '-e',
    'DOCKER_USER=chiskat',
    '-e',
    `DOCKER_PASS=${process.env.DOCKER_PASS ?? ''}`,
    '-e',
    'PUSHRM_FILE=/repo/README.md',
    '-v',
    `${readmePath}:/repo/README.md`,
    'chko/docker-pushrm:1',
  ])
}

export function findRepoRoot(start = dirname(fileURLToPath(import.meta.url))): string {
  let current = resolve(start)
  while (true) {
    if (existsSync(join(current, 'package.json'))) return current
    const parent = dirname(current)
    if (parent === current) return resolve(start, '..')
    current = parent
  }
}

export function calver(): string {
  const parts = new Intl.DateTimeFormat('en-US', {
    timeZone: 'Asia/Shanghai',
    year: 'numeric',
    month: 'numeric',
    day: 'numeric',
  }).formatToParts(new Date())
  const get = (type: string) => parts.find(part => part.type === type)?.value ?? ''

  return `${get('year')}.${get('month')}.${get('day')}`
}

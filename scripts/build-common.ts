import { resolve } from 'node:path'

import {
  calver,
  dockerBuild,
  dockerBuildPuppeteer,
  dockerManifestExists,
  dockerPush,
  dockerReadme,
  findRepoRoot,
} from './docker.js'
import { latestNodeVersion } from './latest-node-version.js'
import { latestNpmVersion } from './latest-npm-version.js'
import { latestPnpmVersion } from './latest-pnpm-version.js'

export type BuildConfig = {
  major: number
  image: string
  variant: 'slim' | 'alpine' | 'full' | 'puppeteer' | 'full-puppeteer'
  description: string
  readme: string
}

export async function buildImage(config: BuildConfig): Promise<void> {
  const repoRoot = findRepoRoot()
  const dateTag = calver()

  const readmePath = resolve(repoRoot, config.readme)

  if (config.variant === 'puppeteer' || config.variant === 'full-puppeteer') {
    const base =
      config.variant === 'puppeteer'
        ? `chiskat/baseline-node${config.major}`
        : `chiskat/baseline-node${config.major}-full`
    if (dockerManifestExists(base, dateTag)) {
      dockerBuildPuppeteer(
        `chiskat/${config.image}`,
        `${base}:${dateTag}`,
        resolve(repoRoot, 'docker/puppeteer.Dockerfile'),
        dateTag
      )
      dockerPush(`chiskat/${config.image}`, dateTag)
    }
    dockerReadme(`chiskat/${config.image}`, config.description, readmePath)
    return
  }

  const nodeBaseVersion = await latestNodeVersion(config.major)
  const suffix = config.variant === 'slim' ? '-slim' : config.variant === 'alpine' ? '-alpine' : ''
  const nodeVersion = `${nodeBaseVersion}${suffix}`

  const npmVersion = await latestNpmVersion(nodeBaseVersion)
  const pnpmVersion = await latestPnpmVersion(nodeBaseVersion)

  const versionTag = `node${nodeVersion}-pnpm${pnpmVersion}`
  const image = `chiskat/${config.image}`

  if (!dockerManifestExists(image, versionTag)) {
    dockerBuild({
      image: config.image,
      dockerfile: resolve(
        repoRoot,
        config.variant === 'alpine'
          ? 'docker/node-corepack-alpine.Dockerfile'
          : 'docker/node-corepack.Dockerfile'
      ),
      calver: dateTag,
      nodeVersion,
      npmVersion,
      pnpmVersion,
    })
    dockerPush(image, dateTag, versionTag)
  }

  dockerReadme(
    image,
    config.description.replace('$NODE_VERSION', nodeVersion).replace('$PNPM_VERSION', pnpmVersion),
    readmePath
  )
}

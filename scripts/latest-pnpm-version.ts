import semver from 'semver'

/** 获取指定 Node.js 版本支持的最新 pnpm 版本号 */
export async function latestPnpmVersion(nodeVersion: string): Promise<string> {
  const response = await fetch('https://registry.npmjs.org/pnpm', {
    headers: { Accept: 'application/vnd.npm.install-v1+json' },
  })

  const data = (await response.json()) as {
    versions: Record<string, { engines?: { node?: string } }>
  }
  const versions = Object.entries(data.versions)
    .filter(([version, { engines }]) => {
      return (
        semver.prerelease(version) === null &&
        engines?.node !== undefined &&
        semver.satisfies(nodeVersion, engines.node)
      )
    })
    .map(([version]) => version)

  return semver.maxSatisfying(versions, '*')!
}

import semver from 'semver'

/** 获取指定 major 版本下最新的 Node.js 版本号 */
export async function latestNodeVersion(major: number): Promise<string> {
  const response = await fetch('https://nodejs.org/dist/index.json')

  if (!response.ok) {
    throw new Error(`获取 Node.js 版本列表失败：${response.status} ${response.statusText}`)
  }

  const data = (await response.json()) as { version: string }[]
  const versions = data.map(({ version }) => semver.clean(version)!)
  const latestVersion = semver.maxSatisfying(versions, `${major}.x`)!

  return latestVersion
}

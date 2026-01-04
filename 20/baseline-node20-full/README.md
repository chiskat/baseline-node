# paperplanecc/baseline-node20-full

![](https://img.shields.io/docker/v/paperplanecc/baseline-node20-full?sort=semver) ![](https://img.shields.io/docker/image-size/paperplanecc/baseline-node20-full)

为前端和 Node.js 开发者提供开箱即用的 Docker 镜像。[GitHub](https://github.com/paperplane-docker/baseline-node)，[源码](https://git.paperplane.cc/paperplane-docker/baseline-node)。

- 基于 `node:20`，并通过 `corepack` 开启 `pnpm` 支持；
- CI/CD 定时任务会每周检查一次 Node.js 和 `pnpm` 是否有新版本，并自动发布，使用 UTC+8 日期形如 `2025.09.01` 作为版本标签。

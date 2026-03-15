# chiskat/baseline-node20-full

![](https://img.shields.io/docker/v/chiskat/baseline-node20-full?sort=semver) ![](https://img.shields.io/docker/image-size/chiskat/baseline-node20-full)

为前端和 Node.js 开发者提供开箱即用的 Docker 镜像。[GitHub](https://github.com/chiskat/baseline-node)，[源码镜像](https://git.paperplane.cc/chiskat/baseline-node)。

- 基于 `node:20`，并通过 `corepack` 开启 `pnpm` 支持；
- CI/CD 定时任务会每周检查一次 Node.js 和 `pnpm` 是否有新版本，并自动发布，使用 UTC+8 日期形如 `2025.09.01` 作为版本标签。

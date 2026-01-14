# chiskat/baseline-node20

![](https://img.shields.io/docker/v/chiskat/baseline-node20?sort=semver) ![](https://img.shields.io/docker/image-size/chiskat/baseline-node20)

为前端和 Node.js 开发者提供开箱即用的 Docker 镜像。[GitHub](https://github.com/paperplane-docker/baseline-node)，[源码](https://git.paperplane.cc/paperplane-docker/baseline-node)。

- 基于 `node:20-slim`，并通过 `corepack` 开启 `pnpm` 支持；
- CI/CD 定时任务会每周检查一次 Node.js 和 `pnpm` 是否有新版本，并自动发布，使用 UTC+8 日期形如 `2025.09.01` 作为版本标签。

# 使用需知

- 注意 `-slim` 的镜像较为精简，如果遇到缺失系统组件等问题，建议使用 `chiskat/baseline-node20-full` 镜像。
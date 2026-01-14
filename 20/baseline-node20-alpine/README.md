# chiskat/baseline-node20-alpine

![](https://img.shields.io/docker/v/chiskat/baseline-node20-alpine?sort=semver) ![](https://img.shields.io/docker/image-size/chiskat/baseline-node20-alpine)

为前端和 Node.js 开发者提供开箱即用的 Docker 镜像。[GitHub](https://github.com/paperplane-docker/baseline-node)，[源码](https://git.paperplane.cc/paperplane-docker/baseline-node)。

- 基于 `node:20-apline`，并通过 `corepack` 开启 `pnpm` 支持；
- 预装 `libc6-compat` 相关系统组件，从而兼容 Next.js；
- CI/CD 定时任务会每周检查一次 Node.js 和 `pnpm` 是否有新版本，并自动发布，使用 UTC+8 日期形如 `2025.09.01` 作为版本标签。

# 使用需知

- 注意 `-apline` 的镜像非常精简，且系统底层依赖和常见 Linux 系统不同，如果遇到问题，建议使用 `chiskat/baseline-node20` 镜像。
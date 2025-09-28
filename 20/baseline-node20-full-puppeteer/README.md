# paperplanecc/baseline-node20-full-puppeteer

![](https://img.shields.io/docker/v/paperplanecc/baseline-node20-full-puppeteer?sort=date) ![](https://img.shields.io/docker/image-size/paperplanecc/baseline-node20-full-puppeteer)

为前端和 Node.js 开发者提供开箱即用且预装 Chromium 并预配 `puppeteer` 的 Docker 镜像。[GitHub](https://github.com/paperplane-docker/baseline-node)，[源码](https://git.paperplane.cc/paperplane-docker/baseline-node)。

- 基于 `paperplanecc/baseline-node20-full` 并同步更新，预装 Chromium 以及相关依赖和字体（包括一套 Emoji 字体）；
- 为 `puppeteer` 配置好了浏览器的启动路径和免下载标志位，可以开箱即用；
- 选用 Chromium 而不是 Chrome，这样可以避免在 ARM 平台启动失败。

# 使用须知

- 在容器中启动 Puppeteer 需要配置 `--no-sandbox` 启动参数，或者启动 Docker 镜像时添加 `--cap-add=SYS_ADMIN` 参数；
- 只自带了一些开源字体，如果有 “网页截图” 等功能需求，文字显示会和常见的 “微软雅黑”、“苹方” 等字体有区别，这些字体需自行处理。
import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 22,
  image: 'baseline-node22-puppeteer',
  variant: 'puppeteer',
  description: 'Node.js (slim), pnpm and Chromium are preinstalled, prepared for puppeteer.',
  readme: '22/baseline-node22-puppeteer/README.md',
})

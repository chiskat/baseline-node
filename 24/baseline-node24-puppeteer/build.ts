import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 24,
  image: 'baseline-node24-puppeteer',
  variant: 'puppeteer',
  description: 'Node.js (slim), pnpm and Chromium are preinstalled, prepared for puppeteer.',
  readme: '24/baseline-node24-puppeteer/README.md',
})

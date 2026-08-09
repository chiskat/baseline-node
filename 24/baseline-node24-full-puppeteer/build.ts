import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 24,
  image: 'baseline-node24-full-puppeteer',
  variant: 'full-puppeteer',
  description: 'Node.js, pnpm and Chromium are preinstalled, prepared for puppeteer.',
  readme: '24/baseline-node24-full-puppeteer/README.md',
})

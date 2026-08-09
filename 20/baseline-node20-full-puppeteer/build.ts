import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 20,
  image: 'baseline-node20-full-puppeteer',
  variant: 'full-puppeteer',
  description: 'Node.js, pnpm and Chromium are preinstalled, prepared for puppeteer.',
  readme: '20/baseline-node20-full-puppeteer/README.md',
})

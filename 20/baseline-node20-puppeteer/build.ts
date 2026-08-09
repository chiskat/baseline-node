import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 20,
  image: 'baseline-node20-puppeteer',
  variant: 'puppeteer',
  description: 'Node.js (slim), pnpm and Chromium are preinstalled, prepared for puppeteer.',
  readme: '20/baseline-node20-puppeteer/README.md',
})

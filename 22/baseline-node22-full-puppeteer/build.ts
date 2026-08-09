import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 22,
  image: 'baseline-node22-full-puppeteer',
  variant: 'full-puppeteer',
  description: 'Node.js, pnpm and Chromium are preinstalled, prepared for puppeteer.',
  readme: '22/baseline-node22-full-puppeteer/README.md',
})

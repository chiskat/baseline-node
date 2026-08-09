import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 20,
  image: 'baseline-node20-full',
  variant: 'full',
  description: 'Node.js v$NODE_VERSION and pnpm@$PNPM_VERSION are preinstalled.',
  readme: '20/baseline-node20-full/README.md',
})

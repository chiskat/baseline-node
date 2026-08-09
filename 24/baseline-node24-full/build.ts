import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 24,
  image: 'baseline-node24-full',
  variant: 'full',
  description: 'Node.js v$NODE_VERSION and pnpm@$PNPM_VERSION are preinstalled.',
  readme: '24/baseline-node24-full/README.md',
})

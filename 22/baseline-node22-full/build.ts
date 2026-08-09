import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 22,
  image: 'baseline-node22-full',
  variant: 'full',
  description: 'Node.js v$NODE_VERSION and pnpm@$PNPM_VERSION are preinstalled.',
  readme: '22/baseline-node22-full/README.md',
})

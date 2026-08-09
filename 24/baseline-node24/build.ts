import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 24,
  image: 'baseline-node24',
  variant: 'slim',
  description: 'Node.js v$NODE_VERSION (slim) and pnpm@$PNPM_VERSION are preinstalled.',
  readme: '24/baseline-node24/README.md',
})

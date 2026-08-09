import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 24,
  image: 'baseline-node24-alpine',
  variant: 'alpine',
  description:
    'Node.js v$NODE_VERSION (alpine) with pnpm@$PNPM_VERSION, alpine but compatible with Next.js',
  readme: '24/baseline-node24-alpine/README.md',
})

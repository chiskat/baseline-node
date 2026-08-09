import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 20,
  image: 'baseline-node20-alpine',
  variant: 'alpine',
  description:
    'Node.js v$NODE_VERSION (alpine) with pnpm@$PNPM_VERSION, alpine but compatible with Next.js',
  readme: '20/baseline-node20-alpine/README.md',
})

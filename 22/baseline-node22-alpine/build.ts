import { buildImage } from '../../scripts/build-common.js'

await buildImage({
  major: 22,
  image: 'baseline-node22-alpine',
  variant: 'alpine',
  description:
    'Node.js v$NODE_VERSION (alpine) with pnpm@$PNPM_VERSION, alpine but compatible with Next.js',
  readme: '22/baseline-node22-alpine/README.md',
})

source "/repo/scripts/latest_node_version.sh"
source "/repo/scripts/latest_npm_version.sh"
source "/repo/scripts/latest_pnpm_version.sh"

export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")
export NODE_VERSION="$(latest_node_version 20)-alpine"
export NPM_VERSION=$(latest_npm_version)
export PNPM_VERSION=$(latest_pnpm_version)

export NODE_NPM_VERSION="node${NODE_VERSION}-pnpm${PNPM_VERSION}"

if ! docker manifest inspect "chiskat/baseline-node20-alpine:$NODE_NPM_VERSION" > /dev/null 2>&1; then
  source "/repo/scripts/docker_build.sh"
  source "/repo/scripts/docker_push.sh"

  docker_build "baseline-node20-alpine" "/repo/docker/node-alpine.Dockerfile"
  docker_push "chiskat/baseline-node20-alpine"
fi

source "/repo/scripts/docker_readme.sh"
docker_readme "chiskat/baseline-node20-alpine" "Node.js v$NODE_VERSION (alpine) with pnpm@$PNPM_VERSION, alpine but compatible with Next.js" "/repo/20/baseline-node20-alpine/README.md"
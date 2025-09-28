source "/repo/scripts/latest_node_version.sh"
source "/repo/scripts/latest_pnpm_version.sh"

export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")
export NODE_VERSION=$(latest_node_version 20)
export PNPM_VERSION=$(latest_pnpm_version)

export NODE_NPM_VERSION="node${NODE_VERSION}-pnpm${PNPM_VERSION}"

if ! docker manifest inspect "paperplanecc/baseline-node20-full:$NODE_NPM_VERSION" > /dev/null 2>&1; then
  source "/repo/scripts/docker_build.sh"
  source "/repo/scripts/docker_push.sh"

  docker_build "baseline-node20-full" "/repo/docker/node.Dockerfile"
  docker_push "paperplanecc/baseline-node20-full"
fi

source "/repo/scripts/docker_readme.sh"
docker_readme "paperplanecc/baseline-node20-full" "Node.js v$NODE_VERSION and pnpm@$PNPM_VERSION are preinstalled." "/repo/20/baseline-node20-full/README.md"
source "/repo/scripts/latest_node_version.sh"
source "/repo/scripts/latest_pnpm_version.sh"

export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")
export NODE_VERSION="$(latest_node_version 20)-slim"
export PNPM_VERSION=$(latest_pnpm_version)

export NODE_NPM_VERSION="node${NODE_VERSION}-pnpm${PNPM_VERSION}"

if ! docker manifest inspect "chiskat/baseline-node20:$NODE_NPM_VERSION" > /dev/null 2>&1; then
  source "/repo/scripts/docker_build.sh"
  source "/repo/scripts/docker_push.sh"

  docker_build "baseline-node20" "/repo/docker/node.Dockerfile"
  docker_push "chiskat/baseline-node20"
fi

source "/repo/scripts/docker_readme.sh"
docker_readme "chiskat/baseline-node20" "Node.js v$NODE_VERSION (slim) and pnpm@$PNPM_VERSION are preinstalled." "/repo/20/baseline-node20/README.md"
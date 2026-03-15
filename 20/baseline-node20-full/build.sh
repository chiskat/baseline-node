REPO_ROOT="${REPO_ROOT:-/repo}"

source "$REPO_ROOT/scripts/latest_node_version.sh"
source "$REPO_ROOT/scripts/latest_npm_version.sh"
source "$REPO_ROOT/scripts/latest_pnpm_version.sh"

export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")
export NODE_VERSION=$(latest_node_version 20)
export NPM_VERSION=$(latest_npm_version)
export PNPM_VERSION=$(latest_pnpm_version)

export NODE_NPM_VERSION="node${NODE_VERSION}-pnpm${PNPM_VERSION}"

if ! docker manifest inspect "chiskat/baseline-node20-full:$NODE_NPM_VERSION" >/dev/null 2>&1; then
  source "$REPO_ROOT/scripts/docker_build.sh"
  source "$REPO_ROOT/scripts/docker_push.sh"

  docker_build "baseline-node20-full" "$REPO_ROOT/docker/node.Dockerfile"
  docker_push "chiskat/baseline-node20-full"
fi

source "$REPO_ROOT/scripts/docker_readme.sh"
docker_readme "chiskat/baseline-node20-full" "Node.js v$NODE_VERSION and pnpm@$PNPM_VERSION are preinstalled." "$REPO_ROOT/20/baseline-node20-full/README.md"

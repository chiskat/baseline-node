REPO_ROOT="${REPO_ROOT:-/repo}"

source "$REPO_ROOT/scripts/latest_node_version.sh"
source "$REPO_ROOT/scripts/latest_npm_version.sh"
source "$REPO_ROOT/scripts/latest_pnpm_latest_version.sh"

export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")
export NODE_VERSION="$(latest_node_version 22)-alpine"
export NPM_VERSION=$(latest_npm_version)
export PNPM_VERSION=$(latest_pnpm_latest_version)

export NODE_NPM_VERSION="node${NODE_VERSION}-pnpm${PNPM_VERSION}"

if ! docker manifest inspect "chiskat/baseline-node22-alpine:$NODE_NPM_VERSION" >/dev/null 2>&1; then
  source "$REPO_ROOT/scripts/docker_build.sh"
  source "$REPO_ROOT/scripts/docker_push.sh"

  docker_build "baseline-node22-alpine" "$REPO_ROOT/docker/node-corepack-alpine.Dockerfile"
  docker_push "chiskat/baseline-node22-alpine"
fi

source "$REPO_ROOT/scripts/docker_readme.sh"
docker_readme "chiskat/baseline-node22-alpine" "Node.js v$NODE_VERSION (alpine) with pnpm@$PNPM_VERSION, alpine but compatible with Next.js" "$REPO_ROOT/22/baseline-node22-alpine/README.md"

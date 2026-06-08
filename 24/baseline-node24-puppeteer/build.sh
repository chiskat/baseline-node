REPO_ROOT="${REPO_ROOT:-/repo}"

export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")

if docker manifest inspect "chiskat/baseline-node24:$CALVER" >/dev/null 2>&1; then
  export VERSION_TAG=$CALVER

  source "$REPO_ROOT/scripts/docker_build_puppeteer.sh"
  source "$REPO_ROOT/scripts/docker_push.sh"

  docker_build_puppeteer "chiskat/baseline-node24-puppeteer" "chiskat/baseline-node24:$CALVER" "$REPO_ROOT/docker/puppeteer.Dockerfile"
  docker_push "chiskat/baseline-node24-puppeteer"
fi

source "$REPO_ROOT/scripts/docker_readme.sh"
docker_readme "chiskat/baseline-node24-puppeteer" "Node.js (slim), pnpm and Chromium are preinstalled, prepared for puppeteer." "$REPO_ROOT/24/baseline-node24-puppeteer/README.md"

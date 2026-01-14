export CALVER=$(date -d "@$(($(date +%s) + 8 * 3600))" "+%Y.%-m.%-d")

if docker manifest inspect "chiskat/baseline-node20:$CALVER" > /dev/null 2>&1; then
  export VERSION_TAG=$CALVER

  source "/repo/scripts/docker_build_puppeteer.sh"
  source "/repo/scripts/docker_push.sh"

  docker_build_puppeteer "chiskat/baseline-node20-puppeteer" "chiskat/baseline-node20:$CALVER" "/repo/docker/puppeteer.Dockerfile"
  docker_push "chiskat/baseline-node20-puppeteer"
fi

source "/repo/scripts/docker_readme.sh"
docker_readme "chiskat/baseline-node20-puppeteer" "Node.js (slim), pnpm and Chromium are preinstalled, prepared for puppeteer." "/repo/20/baseline-node20-puppeteer/README.md"
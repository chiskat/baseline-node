docker_build() {
  docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --progress plain \
    --build-arg NODE_VERSION=$NODE_VERSION \
    --build-arg NPM_VERSION=$NPM_VERSION \
    --build-arg PNPM_VERSION=$PNPM_VERSION \
    -t "chiskat/$1:$CALVER" \
    -f $2 \
    --push \
    .
}

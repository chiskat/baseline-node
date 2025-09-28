docker_build() {
  docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --progress plain --compress \
    --build-arg NODE_VERSION=$NODE_VERSION \
    --build-arg PNPM_VERSION=$PNPM_VERSION \
    -t "paperplanecc/$1:$CALVER" \
    -f $2 \
    .
}
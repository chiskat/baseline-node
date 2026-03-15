docker_build_puppeteer() {
  docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --progress plain \
    --build-arg BASE_IMAGE=$2 \
    -t "$1:$CALVER" \
    -f $3 \
    --push \
    .
}

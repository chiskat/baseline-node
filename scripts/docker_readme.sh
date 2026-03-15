docker_readme() {
  docker run --rm \
    -e PUSHRM_TARGET="docker.io/$1" \
    -e PUSHRM_SHORT="$2" \
    -e DOCKER_USER="chiskat" \
    -e DOCKER_PASS="$DOCKER_PASS" \
    -e PUSHRM_FILE="/repo/README.md" \
    -v "$3:/repo/README.md" \
    chko/docker-pushrm:1
}

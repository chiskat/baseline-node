docker_readme() {
  mkdir -p "/hostdir/$1"
  cp "$3" "/hostdir/$1/README.md"

  docker run --rm \
    -e PUSHRM_TARGET="docker.io/$1" \
    -e PUSHRM_SHORT="$2" \
    -e DOCKER_USER="paperplanecc" \
    -e DOCKER_PASS="$DOCKER_PASS" \
    -e PUSHRM_FILE="/repo/README.md" \
    -v "/root/project-config/baseline-node/$1/README.md:/repo/README.md" \
    chko/docker-pushrm:1

  rm "/hostdir/$1/README.md"
}
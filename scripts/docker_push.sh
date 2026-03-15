docker_push() {
  if [ -n "${NODE_NPM_VERSION+x}" ]; then
    docker buildx imagetools create -t "$1:$NODE_NPM_VERSION" "$1:$CALVER"
  fi
  docker buildx imagetools create -t "$1:latest" "$1:$CALVER"
}

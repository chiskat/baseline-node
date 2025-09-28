docker_push() {
  docker login -u paperplanecc -p $DOCKER_PASS

  if [ -n "${NODE_NPM_VERSION+x}" ]; then
	  docker tag "$1:$CALVER" "$1:$NODE_NPM_VERSION"
  fi
  docker tag "$1:$CALVER" "$1:latest"

  if [ -n "${NODE_NPM_VERSION+x}" ]; then
	  docker push "$1:$NODE_NPM_VERSION"
  fi
  docker push "$1:$CALVER"
  docker push "$1:latest"

  if [ -n "${NODE_NPM_VERSION+x}" ]; then
	  docker rmi "$1:$NODE_NPM_VERSION" || true
  fi
  docker rmi "$1:$CALVER" || true
  docker rmi "$1:latest" || true
}
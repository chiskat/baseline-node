latest_node_version() {
  local MAJOR=$1
  local versions
  local ver

  versions=$(docker run --rm curlimages/curl -s https://nodejs.org/dist/index.json \
    | grep -o "\"version\":\"v${MAJOR}[^\"]*\"" \
    | sed 's/"version":"v//;s/"//' \
    | sort -rV)

  for ver in $versions; do
    if docker manifest inspect "node:${ver}" >/dev/null 2>&1; then
      echo "$ver"
      return 0
    fi
  done

  return 1
}
latest_node_version() {
  echo $(docker run --rm curlimages/curl -s https://nodejs.org/dist/index.json | grep -o "\"version\":\"v$1[^\"]*\"" | head -1 | sed 's/"version":"v//;s/"//')
}
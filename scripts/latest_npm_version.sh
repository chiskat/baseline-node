latest_npm_version() {
  echo $(docker run --rm curlimages/curl -s https://registry.npmjs.org/npm/latest | grep -o '"version":"[^"]*' | head -1 | cut -d'"' -f4)
}
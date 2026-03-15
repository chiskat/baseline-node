latest_npm_version() {
  echo $(curl -s https://registry.npmjs.org/npm/latest | grep -o '"version":"[^"]*' | head -1 | cut -d'"' -f4)
}

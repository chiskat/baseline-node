latest_pnpm_version() {
  echo $(docker run --rm curlimages/curl -s https://registry.npmjs.org/pnpm/latest | grep -o '"version":"[^"]*' | cut -d'"' -f4)
}
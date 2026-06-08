latest_pnpm_latest_version() {
  echo $(curl -s https://registry.npmjs.org/pnpm/latest | grep -o '"version":"[^"]*' | cut -d'"' -f4)
}

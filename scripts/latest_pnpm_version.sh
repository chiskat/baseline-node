latest_pnpm_version() {
  echo $(curl -s https://registry.npmjs.org/pnpm/latest | grep -o '"version":"[^"]*' | cut -d'"' -f4)
}

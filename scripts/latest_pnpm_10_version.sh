latest_pnpm_10_version() {
  local version

  version=$(curl -s https://registry.npmjs.org/pnpm |
    grep -o '"latest-10":"[^"]*' |
    cut -d'"' -f4)

  if [ -z "$version" ]; then
    return 1
  fi

  echo "$version"
}

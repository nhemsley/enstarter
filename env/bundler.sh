alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias bpath='PATH="$(bundle_path):$PATH"'

function bundle_path {
  VENDOR_BUNDLES="$(pwd)/vendor/ruby/$(cat .ruby-version)"
  VENDOR_BIN="$VENDOR_BUNDLES/bin"
  echo "$VENDOR_BIN"
}

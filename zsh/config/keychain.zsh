# load keychain to manage SSH and GPG keys
if command -v keychain &>/dev/null; then
  eval `keychain -q --noask --eval --agents ssh id_rsa id_github id_bitbucket id_gitlab`
fi

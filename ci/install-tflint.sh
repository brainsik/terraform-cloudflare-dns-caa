#!/bin/bash
set -eu -o pipefail

tflint_bin="$HOME/bin/tflint-$TFLINT_VER"

# Bail out if we already have this version installed
if [[ -x "$tflint_bin" ]]; then
    echo "Found $tflint_bin"
    exit 0
fi

# Ensure ~/bin exists
mkdir -p "$HOME/bin"

# Grab the zip file from GitHub releases
pushd "$(mktemp -d -t tflint.XXXXXXXX)"
curl --fail -sS -L -o tflint.zip "https://github.com/terraform-linters/tflint/releases/download/${TFLINT_VER}/tflint_linux_amd64.zip"
unzip -u tflint.zip
chmod +x tflint
mv tflint "$tflint_bin"
popd

# Move binary to ~/bin and symlink
pushd "$HOME/bin"
rm -f tflint
ln -s "$tflint_bin" tflint
popd

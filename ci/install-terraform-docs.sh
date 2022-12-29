#!/bin/bash
set -eu -o pipefail

tfdocs_bin="$HOME/bin/terraform-docs-$TERRAFORM_DOCS_VER"

# Bail out if we already have this version installed
if [[ -x "$tfdocs_bin" ]]; then
    echo "✨ Found $tfdocs_bin"
    exit 0
fi

# Ensure ~/bin exists
mkdir -p "$HOME/bin"

# Grab the zip file from GitHub releases
pushd "$(mktemp -d -t terraform-docs.XXXXXXXX)" >/dev/null
curl --fail -L -o terraform-docs.tar.gz "https://github.com/terraform-docs/terraform-docs/releases/download/$TERRAFORM_DOCS_VER/terraform-docs-$TERRAFORM_DOCS_VER-linux-amd64.tar.gz"
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs "$tfdocs_bin"
popd >/dev/null

# Move binary to ~/bin and symlink
pushd "$HOME/bin" >/dev/null
rm -f terraform-docs
ln -s "$tfdocs_bin" terraform-docs
popd >/dev/null

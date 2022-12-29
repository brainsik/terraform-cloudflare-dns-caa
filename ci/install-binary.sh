#!/bin/bash
set -eu -o pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck source=ci/versions.sh
source "$SCRIPT_DIR/versions.sh"

bin_name=$1
case "$bin_name" in
    terraform-docs)
        bin_name_ver="$bin_name-$TERRAFORM_DOCS_VER"
        bin_dl_file="terraform-docs-$TERRAFORM_DOCS_VER-linux-amd64.tar.gz"
        bin_dl_url="https://github.com/terraform-docs/terraform-docs/releases/download/$TERRAFORM_DOCS_VER/$bin_dl_file"
        ;;
    tflint)
        bin_name_ver="$bin_name-$TFLINT_VER"
        bin_dl_file="tflint_linux_amd64.zip"
        bin_dl_url="https://github.com/terraform-linters/tflint/releases/download/$TFLINT_VER/$bin_dl_file"
        ;;
esac
bin_path="$HOME/bin/$bin_name_ver"

# Bail out if we already have this version installed
if [[ -x "$bin_path" ]]; then
    echo "✨ Found $bin_path"
    exit 0
fi

# Ensure ~/bin exists
mkdir -p "$HOME/bin"

# Grab the archive from GitHub releases
pushd "$(mktemp -d -t "$bin_name.XXXXXXXX")" >/dev/null
curl --fail -# -L -o "$bin_dl_file" "$bin_dl_url"
if echo "$bin_dl_file" | grep -q '\.tar\.gz$'; then
    tar -xzf "$bin_dl_file"
elif echo "$bin_dl_file" | grep -q '\.zip$'; then
    unzip -u "$bin_dl_file"
else
    echo "🚨 Unrecognized extension in $bin_dl_file"
    exit 1
fi
chmod +x "$bin_name"
mv "$bin_name" "$bin_path"
popd >/dev/null

# Move binary to ~/bin and symlink
pushd "$HOME/bin" >/dev/null
rm -f "$bin_name"
ln -s "$bin_path" "$bin_name"
popd >/dev/null

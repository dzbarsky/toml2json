set -eux

bazel build \
    //:for_aarch64-unknown-linux-musl \
    //:for_x86_64-unknown-linux-musl \
    //:for_aarch64-apple-darwin \
    //:for_x86_64-apple-darwin

copy_out() {
    src="$(bazel cquery --output=files "$1")"
    cp "$src" "$2"
}

copy_out //:for_aarch64-unknown-linux-musl toml2json_linux_arm64
copy_out //:for_x86_64-unknown-linux-musl toml2json_linux_amd64
copy_out //:for_aarch64-apple-darwin toml2json_darwin_arm64
copy_out //:for_x86_64-apple-darwin toml2json_darwin_amd64

shasum -a 256 toml2json_* > SHA256.txt

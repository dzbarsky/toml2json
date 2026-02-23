set -eux

bazel build //:all

copy_out() {
    src="$(bazel cquery --output=files "$1")"
    cp "$src" "$2"
}

copy_out //:for_aarch64-unknown-linux-musl toml2json_linux_arm64
copy_out //:for_x86_64-unknown-linux-musl toml2json_linux_amd64
copy_out //:for_aarch64-apple-darwin toml2json_darwin_arm64
copy_out //:for_x86_64-apple-darwin toml2json_darwin_amd64
copy_out //:for_aarch64-pc-windows-gnullvm toml2json_windows_arm64.exe
copy_out //:for_x86_64-pc-windows-gnullvm toml2json_windows_amd64.exe

shasum -a 256 toml2json_* > SHA256.txt

set -eux

#bazel build --remote_header=x-buildbuddy-api-key="$BUILDBUDDY_API_KEY" //:for_all_platforms
# Windows cross-compilation doesn't work with current toolchains...
bazel build //:for_non_windows_platforms

copy_out() {
    src="$(bazel cquery --output=files "$1")"
    cp "$src" "$2"
}

copy_out //:for_aarch64-unknown-linux-musl toml2json_linux_arm64
copy_out //:for_x86_64-unknown-linux-musl toml2json_linux_amd64
copy_out //:for_aarch64-apple-darwin toml2json_darwin_arm64
copy_out //:for_x86_64-apple-darwin toml2json_darwin_amd64

shasum -a 256 toml2json_* > SHA256.txt

set -eux

#bazel build --remote_header=x-buildbuddy-api-key="$BUILDBUDDY_API_KEY" //:for_all_platforms
# Windows cross-compilation doesn't work with current toolchains...
bazel build //:for_non_windows_platforms

mv bazel-out/linux_aarch64-opt/bin/toml2json toml2json_linux_arm64
mv bazel-out/linux_x86_64-opt/bin/toml2json toml2json_linux_amd64
mv bazel-out/macos_aarch64-opt/bin/toml2json toml2json_darwin_arm64
mv bazel-out/macos_x86_64-opt/bin/toml2json toml2json_darwin_amd64

shasum -a 256 toml2json_* > SHA256.txt

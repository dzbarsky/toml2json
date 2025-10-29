set -eux

bazel build --remote_header=x-buildbuddy-api-key="$BUILDBUDDY_API_KEY" //:for_all_platforms

mv bazel-out/linux_aarch64-opt/bin/toml2json toml2json_linux_aarch64
mv bazel-out/linux_x86_64-opt/bin/toml2json toml2json_linux_x86_64
mv bazel-out/macos_aarch64-opt/bin/toml2json toml2json_darwin_aarch64
mv bazel-out/macos_x86_64-opt/bin/toml2json toml2json_darwin_x86_64

shasum -a 256 toml2json_* > SHA256.txt

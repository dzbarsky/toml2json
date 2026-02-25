call bazel build //:for_windows_aarch64

move bazel-out\aarch64-pc-windows-msvc-opt\bin\toml2json.exe toml2json_windows_arm64.exe
certutil -hashfile toml2json_windows_arm64.exe SHA256 > SHA256_windows_arm64.txt

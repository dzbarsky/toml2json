call bazel --output_user_root=C:/b build //:for_aarch64-pc-windows-msvc

move bazel-out\aarch64-pc-windows-msvc-opt\bin\toml2json.exe toml2json_windows_arm64.exe
certutil -hashfile toml2json_windows_arm64.exe SHA256 > SHA256_windows_arm64.txt

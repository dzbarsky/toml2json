call bazel build //:for_x86_64-pc-windows-msvc

move bazel-out\x86_64-pc-windows-msvc-opt\bin\toml2json.exe toml2json_windows_amd64.exe
certutil -hashfile toml2json_windows_amd64.exe SHA256 > SHA256_windows_amd64.txt

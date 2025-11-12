call bazel build //:for_windows_x86_64

move bazel-out\windows_x86_64-opt\bin\toml2json.exe toml2json_windows_amd64.exe
certutil -hashfile toml2json_windows_amd64.exe SHA256 > SHA256_windows_amd64.txt

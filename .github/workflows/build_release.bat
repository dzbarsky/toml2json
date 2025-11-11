call bazel build //:for_windows_platforms --noshow_progress

move bazel-out\windows_x86_64-opt\bin\toml2json.exe toml2json_windows.exe
certutil -hashfile toml2json_windows.exe SHA256 > SHA256.txt

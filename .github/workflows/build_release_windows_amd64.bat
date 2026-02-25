@echo off
setlocal

call bazel build //:for_x86_64-pc-windows-msvc

for /f "delims=" %%i in ('bazel cquery --output=files //:for_x86_64-pc-windows-msvc') do set "BIN=%%i"
set "BIN=%BIN:/=\%"

copy /Y "%BIN%" toml2json_windows_amd64.exe >NUL
certutil -hashfile toml2json_windows_amd64.exe SHA256 > SHA256_windows_amd64.txt

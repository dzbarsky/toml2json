@echo off
setlocal

call bazel build //:for_x86_64-pc-windows-msvc
if errorlevel 1 exit /b %errorlevel%

set "BIN="
for /f "delims=" %%i in ('bazel cquery --output=files //:for_x86_64-pc-windows-msvc') do set "BIN=%%i"
if not defined BIN (
  echo Failed to resolve output file for //:for_x86_64-pc-windows-msvc
  exit /b 1
)

set "BIN=%BIN:/=\%"
copy /Y "%BIN%" "toml2json_windows_amd64.exe" >NUL
if errorlevel 1 exit /b %errorlevel%

certutil -hashfile "toml2json_windows_amd64.exe" SHA256 > "SHA256_windows_amd64.txt"
if errorlevel 1 exit /b %errorlevel%

exit /b 0

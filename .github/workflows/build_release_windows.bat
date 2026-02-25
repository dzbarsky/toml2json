@echo off
setlocal

call bazel build //:for_x86_64-pc-windows-msvc //:for_aarch64-pc-windows-msvc
if errorlevel 1 exit /b %errorlevel%

call :copy_out //:for_x86_64-pc-windows-msvc toml2json_windows_amd64.exe SHA256_windows_amd64.txt
if errorlevel 1 exit /b %errorlevel%

call :copy_out //:for_aarch64-pc-windows-msvc toml2json_windows_arm64.exe SHA256_windows_arm64.txt
if errorlevel 1 exit /b %errorlevel%

exit /b 0

:copy_out
set "TARGET=%~1"
set "OUT=%~2"
set "SUM=%~3"
set "BIN="
for /f "delims=" %%i in ('bazel cquery --output=files %TARGET%') do set "BIN=%%i"
if not defined BIN (
  echo Failed to resolve output file for %TARGET%
  exit /b 1
)
set "BIN=%BIN:/=\%"
copy /Y "%BIN%" "%OUT%" >NUL
if errorlevel 1 exit /b %errorlevel%
certutil -hashfile "%OUT%" SHA256 > "%SUM%"
if errorlevel 1 exit /b %errorlevel%
exit /b 0

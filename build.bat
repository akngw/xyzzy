@echo off
setlocal
cd /d %~dp0

set "VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat"

if not exist "%VCVARSALL_PATH%" (
    echo Error: "%VCVARSALL_PATH%" not found.
    exit /b 1
)

call "%VCVARSALL_PATH%" x86

if "%1"=="" (set CONFIGURATION=Release) else (set CONFIGURATION=%1)
if "%2"=="" (set TARGET=Build) else (set TARGET=%2)
if "%3"=="" (set VERBOSITY=normal) else (set VERBOSITY=%3)

echo Build xyzzy...
msbuild xyzzy.sln /nologo /p:Configuration=%CONFIGURATION% /p:Platform=Win32 /target:%TARGET% /verbosity:%VERBOSITY% %4 %5 %6 %7 %8 %9 || exit /b 1

@echo off
setlocal

rem Initialize x86 environment and build Win32
call "%VSINSTALLDIR%vc\Auxiliary\Build\vcvarsall" x86
MSBuild XecretsFileClassic.sln /m /p:Configuration=Debug;Platform=Win32
MSBuild XecretsFileClassic.sln /m /p:Configuration=Release;Platform=Win32

rem Initialize amd64 environment and build x64
call "%VSINSTALLDIR%vc\Auxiliary\Build\vcvarsall" amd64
MSBuild XecretsFileClassic.sln /m /p:Configuration=Debug;Platform=x64
MSBuild XecretsFileClassic.sln /m /p:Configuration=Release;Platform=x64

rem Initialize cross environment and build ARM64 (x64 host -> ARM64 target)
call "%VSINSTALLDIR%vc\Auxiliary\Build\vcvarsall" amd64_arm64
MSBuild XecretsFileClassic.sln /m /p:Configuration=Debug;Platform=ARM64
MSBuild XecretsFileClassic.sln /m /p:Configuration=Release;Platform=ARM64

endlocal
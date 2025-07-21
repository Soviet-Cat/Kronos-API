@echo off

if /I "%1"=="help" goto showHelp
if "%1"=="" goto showHelp
if "%2"=="" goto showHelp
if "%3"=="" goto showHelp
if "%4"=="" goto showHelp

goto packageCMake

:packageCMake
echo Packaging Kronos-API with CMAKE_SYSTEM_NAME=%1 CMAKE_SYSTEM_PROCESSOR=%2 CMAKE_BUILD_TYPE=%3 PROJECT_VERSION=%4...
if not exist "%CD%\release" mkdir "%CD%\release"
powershell -Command "Compress-Archive -Force -Path '%CD%\install\*' -DestinationPath '%CD%\release\Kronos-API-%1-%2-%3-%4.zip'"
echo Finished packaging.
exit /b

:showHelp
echo Usage: %~n0 CMAKE_SYSTEM_NAME CMAKE_SYSTEM_PROCESSOR CMAKE_BUILD_TYPE PROJECT_VERSION
exit /b
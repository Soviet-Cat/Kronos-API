@echo off

if /I "%1"=="help" goto showHelp
if /I "%1"=="Release" goto configureCMake
if /I "%1"=="Debug" goto configureCMake

goto showHelp

:configureCMake
echo Configuring Kronos-API with CMAKE_BUILD_TYPE=%1...
call cmake -S . -B build -G Ninja -D CMAKE_BUILD_TYPE=%1
echo Finished configuring.
exit /b

:showHelp
echo Usage: %~n0 [Release^|Debug]
exit /b
@echo off
setlocal enabledelayedexpansion

if /I "%1"=="help" goto showHelp
if /I "%1"=="" goto showHelp
if /I "%1"=="Release" goto runCMake
if /I "%1"=="Debug" goto runCMake

set "CMAKE_SYSTEM_NAME="
set "CMAKE_SYSTEM_PROCESSOR="
set "CMAKE_BUILD_TYPE="
set "PROJECT_VERSION="

goto getCMakeCache

:getCMakeCache
echo Retrieving cache...
call cmake -LAH -B build > %CD%\cache\cache.cmake
for /f "usebackq tokens=1* delims=: " %%A in ("%CD%\cache\cache.cmake") do (
    for /f "tokens=1* delims==" %%C in ("%%B") do (
        if /i "%%A"=="PROJECT_VERSION" set "PROJECT_VERSION=%%D"
        if /i "%%A"=="CMAKE_BUILD_TYPE" set "CMAKE_BUILD_TYPE=%%D"
        if /i "%%A"=="CMAKE_SYSTEM_NAME" set "CMAKE_SYSTEM_NAME=%%D"
        if /i "%%A"=="CMAKE_SYSTEM_PROCESSOR" set "CMAKE_SYSTEM_PROCESSOR=%%D"
    )
)
echo CMAKE_SYSTEM_NAME=%CMAKE_SYSTEM_NAME%
echo CMAKE_SYSTEM_PROCESSOR=%CMAKE_SYSTEM_PROCESSOR%
echo CMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE%
echo PROJECT_VERSION=%PROJECT_VERSION%
echo Finished retrieving.
exit /b

:runCMake
set "BUILD_TYPE="
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "$str='%1'; $first=$str.Substring(0,1).ToUpper(); $rest=$str.Substring(1); Write-Output ($first + $rest)"`) do set "BUILD_TYPE=%%~I"
call configure %BUILD_TYPE%
call build
call install
call :getCMakeCache
call package %CMAKE_SYSTEM_NAME% %CMAKE_SYSTEM_PROCESSOR% %CMAKE_BUILD_TYPE% %PROJECT_VERSION%
exit /b

:showHelp
echo Usage: %~n0 [Release^|Debug]
exit /b
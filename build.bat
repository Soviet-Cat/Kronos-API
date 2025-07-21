@echo off

if /I "%1"=="help" goto showHelp 

goto buildCMake

:buildCMake
echo Building Kronos-API...
call cmake --build build
echo Finished building.
exit /b

:showHelp
echo Usage: %~n0 
exit /b
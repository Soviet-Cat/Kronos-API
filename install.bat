@echo off

if /I "%1"=="help" goto showHelp

goto installCMake

:installCMake
echo Installing Kronos-API...
call cmake --install build --prefix install
echo Finished installing.
exit /b

:showHelp
echo Usage: %~n0
exit /b
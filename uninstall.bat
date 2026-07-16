@echo off
cd /d "%~dp0"

echo.
echo Uninstalling madVR...
echo.

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo    Uninstallation failed.
    echo.
    echo    You need to right click "uninstall.bat" and choose "Run as administrator".
    echo.
    pause >nul
    exit /b 1
)

regsvr32.exe madVR.ax /u /s
if %errorLevel% neq 0 goto error

start /w madHcCtrl.exe quit

if exist "%SystemRoot%\SysWOW64\cmd.exe" (
    regsvr32.exe madVR64.ax /u /s
    if %errorLevel% neq 0 goto error
)

:success
echo.
echo    Uninstallation succeeded.
echo.
goto done

:error
echo.
echo    Uninstallation failed.
echo.
echo    Please ensure you are running this script as an administrator.
echo.

:done
pause >nul
exit /b 0

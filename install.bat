@echo off
cd /d "%~dp0"

echo.
echo Installing madVR...
echo.

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo    Installation failed.
    echo.
    echo    You need to right click "install.bat" and choose "Run as administrator".
    echo.
    pause >nul
    exit /b 1
)

regsvr32.exe madVR.ax /s
if %errorLevel% neq 0 goto error

if exist "%SystemRoot%\SysWOW64\cmd.exe" (
    regsvr32.exe madVR64.ax /s
    if %errorLevel% neq 0 goto error
)

:success
echo.
echo    Installation succeeded.
echo.
echo    Please do not delete the madVR folder.
echo    The installer has not copied the files anywhere.
echo.
goto done

:error
echo.
echo    Installation failed.
echo.
echo    Please ensure you are running this script as an administrator.
echo.

:done
pause >nul
exit /b 0

@echo off
cd /d "%~dp0"

echo.
echo.
title restore madVR default settings...

reg delete HKEY_CURRENT_USER\Software\madshi\madVR /f >nul 2>&1

if exist "settings.bin" (
  if exist "settings.bak" (del settings.bak >nul)
  ren settings.bin settings.bak >nul
)

echo    settings were reset to default
echo.
pause >nul
exit /b 0

@echo off

cd /d %~dp0

echo.
call npx --yes npm-check-updates@latest --target latest --pre 1 --upgrade

echo.
pause

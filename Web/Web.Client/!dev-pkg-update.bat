@echo off

cd /d %~dp0

echo.
call npm --global update
echo.
call npx --yes npm-check-updates@latest --target latest --pre 1 --upgrade

echo.
call yarn install
echo.
call yarn up
echo.
call yarn dlx @yarnpkg/sdks vscode
echo.
call yarn

echo.
pause

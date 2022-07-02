@echo off

cd /d %~dp0

echo.
call corepack enable

echo.
call npm --global update
echo.
call npx --yes npm-check-updates@latest --target latest --pre 1 --upgrade

echo.
call yarn set version berry
echo.
call yarn config set --home enableTelemetry false
echo.
call yarn config set enableTelemetry false
echo.
call yarn config set nodeLinker pnp
echo.
call yarn config set pnpMode strict
echo.
call yarn plugin import typescript
echo.
call yarn plugin import interactive-tools
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

@echo off

cd /d %~dp0

echo.
echo Cleaning stage
echo.

del /f /q "%~dp0\.pnp.cjs"
del /f /q "%~dp0\.pnp.loader.mjs"
del /f /q "%~dp0\.vim\coc-settings.json"
del /f /q "%~dp0\.yarn\install-state.gz"
del /f /q "%~dp0\.yarnrc"
del /f /q "%~dp0\.yarnrc.yml"
del /f /q "%~dp0\tsconfig.tsbuildinfo"
del /f /q "%~dp0\Web.Client.esproj.user"
del /f /q "%~dp0\yarn.lock"

rd /s /q "%~dp0\.vim"
rd /s /q "%~dp0\.vs"
rd /s /q "%~dp0\.yarn"
rd /s /q "%~dp0\.yarn\cache"
rd /s /q "%~dp0\.yarn\patches"
rd /s /q "%~dp0\.yarn\plugins"
rd /s /q "%~dp0\.yarn\releases"
rd /s /q "%~dp0\.yarn\sdks"
rd /s /q "%~dp0\.yarn\unplugged"
rd /s /q "%~dp0\.yarn\versions"
rd /s /q "%~dp0\bin"
rd /s /q "%~dp0\build"
rd /s /q "%~dp0\node_modules"
rd /s /q "%~dp0\obj"

echo.
echo Installing stage
echo.

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

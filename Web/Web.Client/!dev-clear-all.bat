@echo off

cd /d %~dp0

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

pause

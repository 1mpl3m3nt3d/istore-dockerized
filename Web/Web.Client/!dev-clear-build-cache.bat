@echo off

cd /d %~dp0

del /f /q "%~dp0\.pnp.cjs"
del /f /q "%~dp0\.pnp.loader.mjs"
del /f /q "%~dp0\.yarn\install-state.gz"
del /f /q "%~dp0\tsconfig.tsbuildinfo"
del /f /q "%~dp0\Web.Client.esproj.user"

rd /s /q "%~dp0\.vs"
rd /s /q "%~dp0\bin"
rd /s /q "%~dp0\build"
rd /s /q "%~dp0\node_modules"
rd /s /q "%~dp0\obj"

pause

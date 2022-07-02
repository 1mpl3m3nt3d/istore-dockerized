@echo off

cd /d %~dp0

cd Web
cd Web.Client

call !dev-start.bat

pause

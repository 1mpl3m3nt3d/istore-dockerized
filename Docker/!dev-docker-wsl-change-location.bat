@echo off

cd /d %~dp0

wsl --list --verbose

wsl --shutdown

mkdir D:\wsl
mkdir D:\wsl\backup
mkdir D:\wsl\data
mkdir D:\wsl\temp

wsl --export docker-desktop-data "D:\wsl\backup\docker-desktop-data.tar"

wsl --unregister docker-desktop-data

wsl --import docker-desktop-data "D:\wsl\data" "D:\wsl\backup\docker-desktop-data.tar" --version 2

pause

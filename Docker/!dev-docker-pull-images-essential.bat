@echo off

cd /d %~dp0

docker pull couchdb:latest
docker pull dpage/pgadmin4:latest
docker pull elasticsearch:8.2.3
docker pull httpd:latest
docker pull mariadb:latest
docker pull mcr.microsoft.com/dotnet/aspnet:3.1
docker pull mcr.microsoft.com/dotnet/aspnet:3.1-bullseye-slim
docker pull mcr.microsoft.com/dotnet/aspnet:5.0
docker pull mcr.microsoft.com/dotnet/aspnet:6.0
docker pull mcr.microsoft.com/dotnet/sdk:3.1
docker pull mcr.microsoft.com/dotnet/sdk:3.1-bullseye
docker pull mcr.microsoft.com/dotnet/sdk:5.0
docker pull mcr.microsoft.com/dotnet/sdk:6.0
docker pull memcached:latest
docker pull mongo-express:latest
docker pull mongo:latest
docker pull mysql:latest
docker pull mysql:oracle
docker pull nginx:latest
docker pull nginx:perl
docker pull node:latest
docker pull node:lts
docker pull node:lts-bullseye
docker pull postgres:latest
docker pull rabbitmq:latest
docker pull rabbitmq:management
docker pull redis:latest

pause

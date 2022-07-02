@echo off

cd /d %~dp0

docker pull couchdb:latest
docker pull dpage/pgadmin4:latest
docker pull elasticsearch:8.2.3
docker pull httpd:alpine
docker pull mariadb:latest
docker pull mcr.microsoft.com/dotnet/aspnet:3.1-alpine
docker pull mcr.microsoft.com/dotnet/aspnet:5.0-alpine
docker pull mcr.microsoft.com/dotnet/aspnet:6.0-alpine
docker pull mcr.microsoft.com/dotnet/sdk:3.1-alpine
docker pull mcr.microsoft.com/dotnet/sdk:5.0-alpine
docker pull mcr.microsoft.com/dotnet/sdk:6.0-alpine
docker pull memcached:alpine
docker pull mongo-express:latest
docker pull mongo:latest
docker pull mysql:latest
docker pull mysql:oracle
docker pull nginx:alpine
docker pull nginx:alpine-perl
docker pull node:alpine
docker pull node:lts-alpine
docker pull postgres:alpine
docker pull rabbitmq:alpine
docker pull rabbitmq:management-alpine
docker pull redis:alpine

pause

@echo off

cd /d %~dp0

dotnet run --configuration Release --project IdentityServer/IdentityServer/IdentityServer.csproj

pause

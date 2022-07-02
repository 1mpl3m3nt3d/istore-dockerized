@echo off

cd /d %~dp0

dotnet run --configuration Release --project Catalog/Catalog.Host/Catalog.Host.csproj

pause

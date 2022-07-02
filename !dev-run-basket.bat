@echo off

cd /d %~dp0

dotnet run --configuration Release --project Basket/Basket.Host/Basket.Host.csproj

pause

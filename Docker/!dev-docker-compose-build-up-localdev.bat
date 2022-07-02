@echo off

cd /d %~dp0

cd ..

docker-compose -f docker-compose.dev.yml build --no-cache
docker-compose -f docker-compose.dev.yml up -d

pause

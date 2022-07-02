@echo off

cd /d %~dp0

cd ..

docker-compose -f docker-compose.prod.yml build --no-cache
docker-compose -f docker-compose.prod.yml up -d

pause

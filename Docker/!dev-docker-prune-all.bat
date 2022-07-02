@echo off

cd /d %~dp0

call docker container prune --force
call docker network prune --force
call docker volume prune --force
call docker builder prune --all --force
call docker buildx prune --all --force

pause

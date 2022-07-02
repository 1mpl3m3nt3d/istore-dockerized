@echo off

cd /d %~dp0

call docker image prune --all --force --filter "label=project=iStore_Basket.Host"
call docker image prune --all --force --filter "label=project=iStore_Catalog.Host"
call docker image prune --all --force --filter "label=project=iStore_IdentityServer"
call docker image prune --all --force --filter "label=project=iStore_Web.Client"

pause

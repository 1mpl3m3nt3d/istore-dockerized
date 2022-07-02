@echo off

cd /d %~dp0

set hosts_file=%WINDIR%\System32\drivers\etc\hosts
set hosts_backup=%WINDIR%\System32\drivers\etc\hosts.istore.bak
set entry_0=0.0.0.0 www.i.store
set entry_127=127.0.0.1 www.i.store
set entry_192=192.168.0.1 www.i.store

echo.
echo Making backup

if exist %hosts_backup% (
  echo.
  echo %hosts_backup% exists!
  echo Skip backupping
  echo.
  echo Checking entries
  goto check_entry_0
) else (
  echo.
  echo %hosts_backup% doesn't exist!
  echo Creating backup to %hosts_backup%
  goto backup_hosts
)

:backup_hosts
copy /V %hosts_file% %hosts_backup%
goto check_entry_0

:check_entry_0
find /i "%entry_0%" %hosts_file% >NUL
if errorlevel 1 (
  echo.
  echo "%entry_0%" not found
  echo Adding entry
  goto add_entry_0
) else (
  echo.
  echo "%entry_0%" found
  echo Skip adding entry
  goto check_entry_127
)

:check_entry_127
find /i "%entry_127%" %hosts_file% >NUL
if errorlevel 1 (
  echo.
  echo "%entry_127%" not found
  echo Adding entry
  goto add_entry_127
) else (
  echo.
  echo "%entry_127%" found
  echo Skip adding entry
  goto check_entry_192
)

:check_entry_192
find /i "%entry_192%" %hosts_file% >NUL
if errorlevel 1 (
  echo.
  echo "%entry_192%" not found
  echo Adding entry
  echo.
  goto add_entry_192
) else (
  echo.
  echo "%entry_192%" found
  echo Skip adding entry
  echo.
  goto end
)

:add_entry_0
echo %entry_0% >> %hosts_file%
goto check_entry_127

:add_entry_127
echo %entry_127% >> %hosts_file%
goto check_entry_192

:add_entry_192
echo %entry_192% >> %hosts_file%
goto end

:end
pause

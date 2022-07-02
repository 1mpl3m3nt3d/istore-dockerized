@echo off

cd /d %~dp0

set folders=("C:\Users\%username%\AppData\Local\Temp\*" "C:\Users\%username%\AppData\Roaming\Temp\*" "C:\Users\%username%\Temp\*" "C:\Windows\Temp\*")

for %%f in %folders% do del /f /s /q %%f
for /d %%d in %folders% do rd %%d /s /q

pause

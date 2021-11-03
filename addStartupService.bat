@echo off　
chcp 65001

echo Please input service name
if [%1] == [] (set/p startupName= >nul) else set startupName=%1%

echo Please input service execute
if [%2] == [] (set/p startupProgram= >nul) else set startupProgram=%2%
 
set startupProgram=%startupProgram:"=%

sc stop %startupName% & sc delete %startupName% & sc create %startupName% binpath="%~dp0%srvany.exe"
sc config %startupName% start=auto
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%startupName%\Parameters" /v "Application" /d "%startupProgram%" /f

echo sdf

net start %startupName%

pause
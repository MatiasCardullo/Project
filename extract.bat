@echo off
set winrar="C:\Program Files\WinRAR\"
if exist %winrar% (
	if "%~1"=="" (set /p "fichero= Insert Scripts Zip: ") else (set "fichero=%~1")
	%winrar%WinRAR.exe x %fichero%
) else (
	echo winrar not installed in %winrar%	
)
@echo off
title Descargar de Mega
set "client=%localappdata%\MEGAcmd\"

if "%~1"=="exit" (
	start /min %client%MegaClient.exe quit
	goto :EOF
)

:again
for /f %%a in ('tasklist /fi "imagename eq MEGAcmdServer.exe"') do (
	timeout /nobreak /t 5 >NUL
	if "%%a"=="MEGAcmdServer.exe" (goto :dwnlad)
)
call %LOCALAPPDATA%\MEGAcmd\mega-version.bat
goto :again

:dwnlad
if not ""=="%~1" (
	if "%~1"=="-b" (
		start /min %client%MegaClient.exe get --ignore-quota-warn %~2
	) else (
		call %client%mega-get --ignore-quota-warn %~1
		echo 
	)
)
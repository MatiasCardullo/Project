@echo off
setlocal enableextensions disabledelayedexpansion

if "%~1"=="" exit /b
for %%F in ("%~1") do (
	set "pathfile=%%~dpnF"
	set "type=%%~xF"
)
if not (%type%==.mp3) C:\Project\bin\ffmpeg -i "%~1" "%pathfile%.mp3"
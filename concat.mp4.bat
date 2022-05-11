@echo off
set ffmpeg=C:\Project\bin\ffmpeg
set "output=%~1.mp4"
if not "%~2"=="" (
	for %%F in ("%~2") do (set "type=%%~xF")
	if "%type%"==".mp4" (%ffmpeg% -i "%~2" -c copy -bsf:v h264_mp4toannexb -f mpegts "1.ts")
	set "concat=concat:1.ts"
) else ( exit )
if not "%~3"=="" (call :transformToTs "%~3" 2.ts)
if not "%~4"=="" (call :transformToTs "%~4" 3.ts)
if not "%~5"=="" (call :transformToTs "%~5" 4.ts)
if not "%~6"=="" (call :transformToTs "%~6" 5.ts)
if not "%~7"=="" (call :transformToTs "%~7" 6.ts)
if not "%~8"=="" (call :transformToTs "%~8" 7.ts)
if not "%~9"=="" (call :transformToTs "%~9" 8.ts)
%ffmpeg% -i "%concat%" -c copy -bsf:a aac_adtstoasc %output%
pause
del 1.ts>NUL
del 2.ts>NUL
del 3.ts>NUL
del 4.ts>NUL
del 5.ts>NUL
del 6.ts>NUL
del 7.ts>NUL
del 8.ts>NUL
goto :eof

:transformToTs
for %%F in ("%~1") do (set "type=%%~xF")
if "%type%"==".mp4" (%ffmpeg% -i "%~1" -c copy -bsf:v h264_mp4toannexb -f mpegts %~2)
set "concat=%concat%|%~2"

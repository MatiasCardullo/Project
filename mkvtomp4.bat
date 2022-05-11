for %%F in ("%~1") do (
	set "type=%%~xF"
	set "name=%%~dpnF.mp4"
)
if "%type%"==".mkv" (
	C:\Project\bin\ffmpeg -i "%~1" -vcodec copy -acodec copy "%name%"
)

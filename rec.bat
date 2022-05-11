@echo off
if exist output.mp4 (
	set /a numFile=0
	:loop
	set /a numFile=%numFile%+1
	if exist "output-%numFile%.mkv" (goto :loop)
	set "file=output-%numFile%.mkv"
) else (set "file=output.mkv")
start /min C:\Project\bin\ffmpeg -f gdigrab -framerate 10 -i desktop %file%
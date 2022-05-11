@echo off
if ""=="%~1" (goto :eof)
set SDL_AUDIODRIVER=directsound
set ffplay=C:\Project\bin\ffplay
for /F "tokens=2 delims=/" %%a in ("%~1") do (
	if "%%a"=="www.youtube.com" (
		if exist "%temp%\tempYtbMp4" (del "%temp%\tempYtbMp4\*.mp4">NUL) else (mkdir "%temp%\tempYtbMp4")
		pushd "%temp%\tempYtbMp4"
		ytb.mp4 "%~1"
		for %%F in ("*.mp4") do (
			run "%%F"
			del *.mp4
			popd
			goto :eof
		)
	)
)
for %%F in ("%~1") do (
	set "title=%%~nF"
	if "%%~xF"==".gif" (goto :gif)
	if "%%~xF"==".wav" (goto :music)
	if "%%~xF"==".mid" (goto :music)
	if "%%~xF"==".mp3" (goto :music)
	if "%%~xF"==".opus" (goto :music)
	if "%%~xF"==".3gp" (goto :video)
	if "%%~xF"==".avi" (goto :video)
	if "%%~xF"==".mp4" (goto :video)
	if "%%~xF"==".mkv" (goto :video)
	if "%%~xF"==".mpg" (goto :video)
	if "%%~xF"==".mpeg" (goto :video)
	if "%%~xF"==".wmv" (goto :video)
	if "%%~xF"==".mov" (goto :video)
	if "%%~xF"==".bmp" (goto :image)
	if "%%~xF"==".jpeg" (goto :image)
	if "%%~xF"==".jpg" (goto :image)
	if "%%~xF"==".png" (goto :image)
	if "%%~xF"==".txt" (goto :txt)
	:gif
	%ffplay% -window_title "%title%" -autoexit -loop 20 "%~1">NUL
	goto :eof
	:image
	%ffplay% -window_title "%title%" -autoexit -loop 300 "%~1">NUL
	goto :eof
	:txt
	%ffplay% -window_title "%title%" "%~1">NUL
	goto :eof
	:music
	%ffplay% -window_title "%title%" -showmode 1 -autoexit "%~1">NUL
	goto :eof
	:video
	%ffplay% -fs -window_title "%title%" -autoexit "%~1">NUL
	goto :eof
)

@echo off
if not "%~1"=="" (
	if "%~1"=="-b" (
		for /F "tokens=2 delims=/" %%a in ("%~2") do (
			if "%%a"=="nhentai.net" (start /min C:/Project/bin/hitomi_downloader_GUI.exe)
			else if "%%a"=="www.mediafire.com" (start /min mediafire "%~2")
			else if "%%a"=="mega.nz" (call mega -b "%~2")
			else if "%%a"=="www.youtube.com" (
				if "%~3"=="mp4" (start /min ytb.mp4 "%~2")
				if "%~3"=="mp3" (start /min ytb.mp3 "%~2")
			)
			else ( C:/Project/bin/wget.exe "%~1" )
		)
	) else (
		for /F "tokens=2 delims=/" %%a in ("%~1") do (
			if "%%a"=="nhentai.net" (start C:/Project/bin/hitomi_downloader_GUI.exe)
			else if "%%a"=="www.mediafire.com" (call mediafire "%~1")
			else if "%%a"=="mega.nz" (call mega "%~1")
			else if "%%a"=="www.youtube.com" (
				if "%~2"=="mp4" (call ytb.mp4 "%~1")
				if "%~2"=="mp3" (call ytb.mp3 "%~1")
			)
			else ( C:/Project/bin/wget.exe "%~1" )
		)
	)
)

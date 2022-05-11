call :functionMove "%~1\WhatsApp Image*.*" "%cdCel%\WhatsApp"
call :functionMove "%~1\WhatsApp Video*.*" "%cdCel%\WhatsApp"
call :functionMove "%~1\*.zip" "%cdFiles%\zips"
call :functionMove "%~1\*.rar" "%cdFiles%\zips"
call :functionMove "%~1\*.7z" "%cdFiles%\zips"
call :functionMove "%~1\*.apk" "%cdFiles%\apk"
call :functionMove "%~1\*.exe" "%cdFiles%\exe"
call :functionMove "%~1\*.iso" "%cdFiles%\iso"
call :functionMove "%~1\*.img" "%cdFiles%\iso"
call :functionMove "%~1\*.txt" "%cdFiles%\txt"
call :functionMove "%~1\*.pdf" "%cdFiles%\pdf"
call :functionMove "%~1\*.doc" "%cdFiles%\Office"
call :functionMove "%~1\*.docx" "%cdFiles%\Office"
call :functionMove "%~1\*.xls" "%cdFiles%\Office"
call :functionMove "%~1\*.xlsx" "%cdFiles%\Office"
call :functionMove "%~1\*.ppt" "%cdFiles%\Office"
call :functionMove "%~1\*.pptx" "%cdFiles%\Office"
call :functionMove "%~1\*.pps" "%cdFiles%\Office"
call :functionMove "%~1\*.ppsx" "%cdFiles%\Office"
call :functionMove "%~1\*.jpg" "%cdFiles%\imagenes"
call :functionMove "%~1\*.jpeg" "%cdFiles%\imagenes"
call :functionMove "%~1\*.png" "%cdFiles%\imagenes"
call :functionMove "%~1\*.bmp" "%cdFiles%\imagenes"
call :functionMove "%~1\*.webm" "%cdFiles%\videos"
call :functionMove "%~1\*.avi" "%cdFiles%\videos"
call :functionMove "%~1\*.mkv" "%cdFiles%\videos"
call :functionMove "%~1\*.mp4" "%cdFiles%\videos"
call :functionMove "%~1\*.mp3" "%cdFiles%\musica"
call :functionMove "%~1\*.jar" "%cdFiles%\jar"
call :functionMove "%~1\*.veg" "%cdFiles%\Vegas"
call :functionMove "%~1\*.veg.*" "%cdFiles%\Vegas"
call :functionMove "%~1\*.htm" "%cdFiles%\html"
call :functionMove "%~1\*.html" "%cdFiles%\html"

:functionMove 
if exist "%~1" (
	if not exist "%~2" (md "%~2")
	if exist "%~2\%~nx1" (
		fc "%~1" "%~2\%~nx1"
		if %errorlevel%==()
	) else (
		if not "%~1" == "*.htm" if not "%~1" == "*.html" (goto :noWeb)
		for %%F in ("%~1") do move /y "%%~dpnF_files" "%~2"
		for %%F in ("%~1") do move /y "%%~dpnF_archivos" "%~2"
		:noWeb
		move "%~1" "%~2"
	)
)
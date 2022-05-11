@echo off
title Descargar de Mediafire
set wget=C:\Project\bin\wget.exe
set axel=C:\Project\bin\axel.exe
if "%~1"=="-b" (
	set background=1
	set "linkMediafire=%~2"
) else (
	set background=0
	set "linkMediafire=%~1"
)
for /F "tokens=3 delims=/" %%a in ("%linkMediafire%") do (
	if "folder"=="%%a" (
		for /F "tokens=4 delims=/" %%b in ("%linkMediafire%") do (set "keys=%%b")
		for %%b in (%keys%) do (
			set "linkMediafire=https://www.mediafire.com/file/%%b"
			call :download
		)
	)
	if "file"=="%%a" call :download
)
goto :eof

:download
for /F "tokens=4 delims=/" %%c in ("%linkMediafire%") do (set "key=%%c")
%wget% -c -nc -q -O %tmp%\Mediafire%key%.html "%linkMediafire%"
findstr "download.*%key%" %tmp%\Mediafire%key%.html>%tmp%\Mediafire%key%.tmp
findstr "optFileName" %tmp%\Mediafire%key%.html>%tmp%\Mediafire%key%.title
del %tmp%\Mediafire%key%.html
for /F delims^=^"^ tokens^=2 %%c in (%tmp%\Mediafire%key%.title) do (
	set fileName="%%c"
	del %tmp%\Mediafire%key%.title
)

for /F delims^=^"^ tokens^=2 %%c in (%tmp%\Mediafire%key%.tmp) do (
	set "linkMediafire=%%c"
	del %tmp%\Mediafire%key%.tmp
	call :wget
	goto :eof
)

:wget
if "%background%"=="0" (%axel% -n 10 -o %fileName% -a %linkMediafire% ) else (%wget% -b -O %fileName% %linkMediafire%)
echo 
goto :eof
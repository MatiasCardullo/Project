@echo off
if exist "%temp%\es.dll-files.com" rmdir /s /q "%temp%\es.dll-files.com"
cd %temp%
C:\Project\bin\wget -q -N -r -l1 https://es.dll-files.com/%~1.html
cd es.dll-files.com
findstr "\<bit\>" "%~1.html">bit.txt
findstr "download/.*" "%~1.html">download.txt
for /F "delims=>,< tokens=4" %%a in (bit.txt) do (
	echo %%a>>bit2.txt
)
for /F delims^=^"^ tokens^=4 %%a in (download.txt) do (
	echo %%a>>download2.txt
)
copy /y download2.txt download.txt>nul
set xOS=64bit
IF %PROCESSOR_ARCHITECTURE% == x86 (IF NOT DEFINED PROCESSOR_ARCHITEW6432 Set xOS=32bit)
for /F "tokens=*" %%a in (bit2.txt) do (
	if %%a==%xOS% (
		goto :link
	)
	more +1 download2.txt > download2.new.txt
	move /y download2.new.txt download2.txt>nul
)
:link
echo on
for /F "delims=/ tokens=2" %%a in (download2.txt) do (
	if not "%%a"=="" (move /y download2.txt download.txt>nul)
	goto :dwnld
)
:dwnld
for /F "delims=/ tokens=2" %%a in (download.txt) do (
	for /F "tokens=*" %%b in ('dir /b /s "download\%%a"') do (
		start "" "%%b"
		goto :eof
	)
)
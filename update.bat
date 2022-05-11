@echo off
mkdir %temp%\version
pushd %temp%\version
	echo update megacmd ...
start /min %LOCALAPPDATA%\MEGAcmd\MEGAcmdUpdater
set xOS=64
IF %PROCESSOR_ARCHITECTURE% == x86 (IF NOT DEFINED PROCESSOR_ARCHITEW6432 Set xOS=32)
echo sistema %xOS%
if %xOS%==64 (
	echo update gdrive ...
	C:\Project\bin\wget -b -q -N -O "C:\Project\bin\gdrive.exe" "https://drive.google.com/uc?id=1zEaLExCMQnwftSYCF7GTONHX-lV7SlTe&export=download"
	echo update ffmpeg ...
	C:\Project\bin\wget -b -q -N "https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-latest-win64-static.zip"
	echo update wget ...
	C:\Project\bin\wget -b -q -N -erobots=off -np -nd -r -l 1 -A *win64.zip "https://eternallybored.org/misc/wget/releases/"
	echo update nircmd ...
	C:\Project\bin\wget -b -q -N "http://www.nirsoft.net/utils/nircmd-x64.zip"
) else (
	echo update gdrive ...
	C:\Project\bin\wget -b -q -N -O "C:\Project\bin\gdrive.exe" "https://drive.google.com/uc?id=1nbwcqKI1ohhjbUKLH2NcPSRKvYdBwfEI&export=download"
	echo update ffmpeg ...
	C:\Project\bin\wget -b -q -N "https://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-latest-win32-static.zip"
	echo update wget ...
	C:\Project\bin\wget -b -q -N -erobots=off -np -nd -r -l 1 -A *win32.zip "https://eternallybored.org/misc/wget/releases/"
	echo update nircmd ...
	C:\Project\bin\wget -b -q -N "http://www.nirsoft.net/utils/nircmd.zip"
)
if NOT exist "C:\Project\bin\fonts\fonts.conf" (
	echo download fonts ...
	mkdir C:\Project\bin\fonts
	C:\Project\bin\wget -b -q -N -O "C:\Project\bin\fonts\fonts.conf" "https://raw.githubusercontent.com/FiveYellowMice/how-to-convert-videos-with-ffmpeg-zh/master/etc/fontconfig-windows/fonts.conf"
)
echo update youtube-dl ...
C:\Project\bin\wget -b -q -N -O "C:\Project\bin\youtube-dl.exe" "https://youtube-dl.org/downloads/latest/youtube-dl.exe"
echo update axel and cygwin1 ...
C:\Project\bin\wget -b -q -N -O "C:\Project\bin\axel.exe" "https://github.com/DrShadow97/Project/raw/master/bin/axel.exe"
C:\Project\bin\wget -b -q -N -O "C:\Project\bin\cygwin1.dll" "https://github.com/DrShadow97/Project/raw/master/bin/cygwin1.dll"
echo update adb´s ...
C:\Project\bin\wget -b -q -N -O "C:\Project\bin\adb.exe" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/adb.exe"
C:\Project\bin\wget -b -q -N -O "C:\Project\bin\AdbWinApi.dll" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/AdbWinApi.dll"
C:\Project\bin\wget -b -q -N -O "C:\Project\bin\AdbWinUsbApi.dll" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/AdbWinUsbApi.dll"
echo update ImageToPdf ...
C:\Project\bin\wget -b -q -N "http://www.compulsivecode.com/Images/ImageToPDForXPS.zip"
echo update mpxplay ...
C:\Project\bin\wget -b -q -N "https://ufpr.dl.sourceforge.net/project/mpxplay/Mpxplay/Mpxplay%20v1.64/Mpxplay_v164_Win32_FFmpeg.zip"
rem OpenCL.dll
echo update pstools ...
C:\Project\bin\wget -b -q -N https://download.sysinternals.com/files/PSTools.zip

:wait
for /f %%a in ('tasklist /fi "imagename eq wget.exe"') do (
	timeout /nobreak /t 1 >NUL
	if "%%a"=="wget.exe" (goto :wait)
)

"%ProgramFiles%\WinRAR\WinRAR.exe" e *.zip *.exe C:\Project\bin\ -IBCK -u -y
"%ProgramFiles%\WinRAR\WinRAR.exe" e *.zip *.dll C:\Project\bin\ -IBCK -u -y
call %LOCALAPPDATA%\MEGAcmd\mega-version.bat
popd
@echo off
color 0a

if not exist "D:\Celu\download" mkdir "D:\Celu\download"
if not exist "D:\Celu\Pictures" mkdir "D:\Celu\Pictures"
if not exist "D:\Celu\DCIM" mkdir "D:\Celu\DCIM"
if not exist "D:\Celu\Videoder" mkdir "D:\Celu\Videoder"
if not exist "D:\Celu\WhatsApp\Media\.Statuses" mkdir "D:\Celu\WhatsApp\Media\.Statuses"
if not exist "D:\Celu\WhatsApp\Media\WhatsApp_Statuses" mkdir "D:\Celu\WhatsApp\Media\WhatsApp_Statuses"
if not exist "D:\Celu\WhatsApp\Media\WhatsApp Video" mkdir "D:\Celu\WhatsApp\Media\WhatsApp Video"
if not exist "D:\Celu\WhatsApp\Media\WhatsApp Animated Gifs" mkdir "D:\Celu\WhatsApp\Media\WhatsApp Animated Gifs"
if not exist "D:\Celu\WhatsApp\Media\WhatsApp Images" mkdir "D:\Celu\WhatsApp\Media\WhatsApp Images"
if not exist "D:\Celu\WhatsApp\Media\WhatsApp Audio" mkdir "D:\Celu\WhatsApp\Media\WhatsApp Audio"
if not exist "D:\Celu\WhatsApp\Media\WhatsApp Documents" mkdir "D:\Celu\WhatsApp\Media\WhatsApp Documents"
if not exist "D:\Celu\Telegram\Telegram Audio" mkdir "D:\Celu\Telegram\Telegram Audio"
if not exist "D:\Celu\Telegram\Telegram Images" mkdir "D:\Celu\Telegram\Telegram Images"
if not exist "D:\Celu\Telegram\Telegram Documents" mkdir "D:\Celu\Telegram\Telegram Documents"
if not exist "D:\Celu\Telegram\Telegram Video" mkdir "D:\Celu\Telegram\Telegram Video"

echo __________________________________
echo  Moviendo archivos del celular...
start /min adbCelu "/sdcard/download" "D:\Celu\download"
start /min adbCelu "/sdcard/Pictures" "D:\Celu\Pictures"
C:\Project\bin\adb -d shell rm -f -rR "/sdcard/DCIM/.thumbnails" >NUL
start /min adbCelu "/sdcard/DCIM" "D:\Celu\DCIM"
start /min adbCelu "/sdcard/Videoder" "D:\Celu\Videoder"
start /min adbCelu "/sdcard/WhatsApp/Media/.Statuses" "D:\Celu\WhatsApp\Media\.Statuses"
start /min adbCelu "/sdcard/WhatsApp/Media/WhatsApp_Statuses" "D:\Celu\WhatsApp\Media\WhatsApp_Statuses"
C:\Project\bin\adb -d shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Animated Gifs/Sent" >NUL
start /min adbCelu "/sdcard/WhatsApp/Media/WhatsApp Animated Gifs" "D:\Celu\WhatsApp\Media\WhatsApp Animated Gifs"
C:\Project\bin\adb -d shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Video/Sent" >NUL
start /min adbCelu "/sdcard/WhatsApp/Media/WhatsApp Video" "D:\Celu\WhatsApp\Media\WhatsApp Video"
C:\Project\bin\adb -d shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Images/Sent" >NUL
start /min adbCelu "/sdcard/WhatsApp/Media/WhatsApp Images" "D:\Celu\WhatsApp\Media\WhatsApp Images"
C:\Project\bin\adb -d shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Audio/Sent" >NUL
start /min adbCelu "/sdcard/WhatsApp/Media/WhatsApp Audio" "D:\Celu\WhatsApp\Media\WhatsApp Audio"
C:\Project\bin\adb -d shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Documents/Sent" >NUL
start /min adbCelu "/sdcard/WhatsApp/Media/WhatsApp Documents" "D:\Celu\WhatsApp\Media\WhatsApp Documents"
start /min adbCelu "/sdcard/Telegram/Telegram Audio" "D:\Celu\Telegram\Telegram Audio"
start /min adbCelu "/sdcard/Telegram/Telegram Images" "D:\Celu\Telegram\Telegram Images"
start /min adbCelu "/sdcard/Telegram/Telegram Documents" "D:\Celu\Telegram\Telegram Documents"
start /min adbCelu "/sdcard/Telegram/Telegram Video" "D:\Celu\Telegram\Telegram Video"

:waitADB
for /f %%a in ('tasklist /fi "windowtitle eq adbCelu"') do (
	timeout /nobreak /t 1 >NUL
	if "%%a"=="adb.exe" (goto :waitADB)
)
taskkill /f /im adb.exe >NUL

echo  Ya puede desconectar el celular

echo  Eliminando duplicados...
start /min C:\CloneSpy\CloneSpy64 -p1 "D:\Celu\WhatsApp\Media" -a C:\Project\settings.cst -e
	timeout /nobreak /t 2 >NUL
start /min C:\CloneSpy\CloneSpy64 -p1 "D:\Celu\Telegram" -a C:\Project\settings.cst -e
	timeout /nobreak /t 2 >NUL
start /min C:\CloneSpy\CloneSpy64 -p1 "D:\Celu\Pictures" -a C:\Project\settings.cst -e
	timeout /nobreak /t 2 >NUL
start /min C:\CloneSpy\CloneSpy64 -p1 "D:\Celu\download" -a C:\Project\settings.cst -e

:waitCloneSpy
timeout /nobreak /t 1 >NUL
for /f %%a in ('tasklist /fi "imagename eq CloneSpy64.exe"') do (
	if "%%a"=="CloneSpy64.exe" (goto :waitCloneSpy)
)

echo  Ordenando por fecha...
start /min dateSorting "D:\Celu\WhatsApp\Media\.Statuses"
start /min dateSorting "D:\Celu\WhatsApp\Media\WhatsApp Animated Gifs"
start /min dateSorting "D:\Celu\WhatsApp\Media\WhatsApp Video"
start /min dateSorting "D:\Celu\WhatsApp\Media\WhatsApp Images"
start /min dateSorting "D:\Celu\WhatsApp\Media\WhatsApp Audio"
start /min dateSorting "D:\Celu\WhatsApp\Media\WhatsApp Documents"
start /min dateSorting "D:\Celu\WhatsApp\Media\WhatsApp_Statuses"
start /min dateSorting "D:\Celu\Telegram\Telegram Audio"
start /min dateSorting "D:\Celu\Telegram\Telegram Images"
start /min dateSorting "D:\Celu\Telegram\Telegram Video"
start /min dateSorting "D:\Celu\Telegram\Telegram Documents"

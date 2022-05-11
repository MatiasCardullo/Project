@echo off
set "input=%~1"
for %%F in ("%~1") do set "output=%%~dpnF.png"
C:\Project\bin\ffmpeg -i "%input%" -lavfi showspectrumpic=s=1600x400 "%output%"

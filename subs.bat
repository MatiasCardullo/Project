@echo off
set "path=C:\Project\bin"
set FC_CONFIG_DIR=%path%\fonts
set FONTCONFIG_FILE=%path%\fonts\fonts.conf
set FONTCONFIG_PATH=%path%\fonts
%path%\ffmpeg -i "%~2" subtitle.ass
rem %path%\ffmpeg -i "%~1" -vf "scale=-1:480,subtitles=subtitle.ass" -map 0:0 -speed 5 -c:v libvpx-vp9 -b:v 1000K -threads 8 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -g 9999 -aq-mode 0 -map 0:1 -c:a libopus -f mp4 out.mp4
rem %path%\ffmpeg -i "%~1" -vf "ass=subtitle.ass" -c:v libx264 -crf 15  -c:a aac -strict -2 -ss 60 -t 60 "test.mp4"
%path%\ffmpeg -i "%~1" -vf "ass=subtitle.ass" -c:v libx264 -crf 18 -c:a aac -strict -2 out.mp4
del subtitle.ass
exit
@echo off
:loop
cls
color 0c

REM //SETTINGS
SET recording_time=1800
SET cctvroot=E:

REM //CAM RTSP STREAMS
SET cam1_rtsp=rtsp://admin:111111@qQ@192.168.100.121:554/media/video1
SET cam2_rtsp=rtsp://admin:111111@qQ@192.168.100.121:554/media/video1
SET cam3_rtsp=rtsp://admin:111111@qQ@192.168.100.121:554/media/video1
SET cam4_rtsp=rtsp://admin:111111@qQ@192.168.100.121:554/media/video1

REM //CAM NAMES
SET cam1_name=FRONTLEFT
SET cam2_name=FRONTRIGHT
SET cam3_name=BACKDOOR
SET cam4_name=BACKYARD



set MYTIME=%time:~0,2%-%time:~3,2%-%time:~6,2%
set yy=%date:~-4%
set mm=%date:~-7,2%
set dd=%date:~-10,2%
set MYDATE=%yy%-%mm%-%dd%

@setlocal enableextensions enabledelayedexpansion
for /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='%cctvroot%'" get FreeSpace /format:value`) do set FreeSpace=%%x
set /a kb=%FreeSpace:~0,-4%
set /a mb = kb/1024
set /a gb = mb/1024

REM //VIDEO FILE NAMES
SET cam1_file_name="%cctvroot%\CCTV\%cam1_name%\%cam1_name%-%MYDATE%-%MYTIME%"
SET cam2_file_name="%cctvroot%\CCTV\%cam2_name%\%cam2_name%-%MYDATE%-%MYTIME%"
SET cam3_file_name="%cctvroot%\CCTV\%cam3_name%\%cam3_name%-%MYDATE%-%MYTIME%"
SET cam4_file_name="%cctvroot%\CCTV\%cam4_name%\%cam4_name%-%MYDATE%-%MYTIME%"


if not exist "%cctvroot%\CCTV\%cam1_name%" mkdir "%cctvroot%\CCTV\%cam1_name%"
if not exist "%cctvroot%\CCTV\%cam2_name%" mkdir "%cctvroot%\CCTV\%cam2_name%"
if not exist "%cctvroot%\CCTV\%cam3_name%" mkdir "%cctvroot%\CCTV\%cam3_name%"
if not exist "%cctvroot%\CCTV\%cam4_name%" mkdir "%cctvroot%\CCTV\%cam4_name%"

echo =====================================================
forfiles /p "%cctvroot%\CCTV\%cam1_name%" /s /m *.* /c "cmd /c Del @path" /d -7
forfiles /p "%cctvroot%\CCTV\%cam2_name%" /s /m *.* /c "cmd /c Del @path" /d -7
forfiles /p "%cctvroot%\CCTV\%cam3_name%" /s /m *.* /c "cmd /c Del @path" /d -7
forfiles /p "%cctvroot%\CCTV\%cam4_name%" /s /m *.* /c "cmd /c Del @path" /d -7
echo =====================================================
echo.
echo =====================================================
echo Remaining Diskspace: %gb%GB / %mb%MB / %kb%KB
if %gb% lss 10 @echo WARNING: %gb% remaining diskspace.
echo Recording Drive: %cctvroot%/CCTV
echo Start Date: %date:~0,2%/%date:~3,2%/%date:~6,4% %time:~0,2%-%time:~3,2%-%time:~6,2%
echo =====================================================

start "" "vlc.exe" -vvv %cam1_rtsp% --sout="#transcode{vcodec=mp4v}:std{access=file,mux=mp4,dst=%cam1_file_name%.mp4}"
timeout /t 3 >null

timeout /t %recording_time% >null
taskkill /f /im "vlc.exe" >nul
goto loop
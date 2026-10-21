@echo off
chcp 65001 >nul
rem PC control for the TV via scrcpy.
rem Usage: set TV_IP=192.168.1.50 && control.cmd
rem Requires adb + scrcpy in PATH.
rem The Amlogic hardware encoder emits corrupt frames (QP 52 out of range),
rem so force the software encoder.
if "%TV_IP%"=="" set TV_IP=192.168.1.50
set TV=%TV_IP%:5555

adb connect %TV%
start "" scrcpy -s %TV% --window-title "TV - PC control" --max-size 1280 --video-bit-rate 2M --no-audio --video-encoder c2.android.avc.encoder

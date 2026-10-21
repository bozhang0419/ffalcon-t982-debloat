@echo off
chcp 65001 >nul
rem Restore script for FFALCON/TCL T982 (Android 11) debloat.
rem Usage: set TV_IP=192.168.1.50 && restore.cmd
rem Requires adb in PATH (Android platform-tools).
set ADB=adb
if "%TV_IP%"=="" set TV_IP=192.168.1.50
set TV=%TV_IP%:5555

%ADB% connect %TV%

echo [1/3] Re-enabling 24 disabled packages...
for %%p in (
com.tcl.bootadservice
com.tcl.bi
com.tcl.c2dm.client
com.tcl.recognize.service
com.tcl.wholenetsearch
com.tcl.playskill
com.tcl.appreciate.art
com.tcl.useragreement
com.tcl.logkit
android.autoinstalls.config.tcl.device
com.tcl.tshop
com.tcl.gamecenter
com.tcl.ffeducation
com.tcl.videocall
com.tcl.weixin
com.tcl.tclmusic
com.tcl.browser
com.tcl.common.weather
com.audiocn.karaoke.micmanager
com.huawei.himovceie
com.hunantv.market
com.tcl.walleve
com.tcl.micmanager
com.tcl.usercenter
) do %ADB% shell pm enable --user 0 %%p

echo [2/3] Switching default HOME back to com.tcl.cyberui...
%ADB% shell cmd package set-home-activity --user 0 com.tcl.cyberui/.MainActivity

echo [3/3] Done. To also remove the replacement launcher, uncomment the next line:
rem %ADB% shell pm uninstall --user 0 local.quiettv.launcher

echo.
pause

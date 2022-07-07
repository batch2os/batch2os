@echo off
@set b2ousername=%1%
title batch2os - Now entering Recovery
:main
cls
echo --Enter Recovery Mode---------------------------------------------------------
echo # Using the batch2os System Backup utility requires you enter Recovery Mode. #
echo # Note that this mode can make significant modifications to your system.     #
echo #                                                                            #
echo # Enter Recovery Mode?                                                       #
echo # 1: Yes                                                                     #
echo # 2: No                                                                      #
echo ------------------------------------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto enter-recovery
if %ERRORLEVEL%==2 goto no
goto main
:enter-recovery
cls
echo ++Enter Recovery Mode++++++
echo + Entering Recovery....   +
echo +++++++++++++++++++++++++++
cd C:\"Program Files"\batch2os\sys\pkgs\rec\apps\backup\
call main.bat
exit
:no
cls
cd C:\"Program Files"\batch2os\apps\dashboard\
call main.bat %b2ousername%
exit
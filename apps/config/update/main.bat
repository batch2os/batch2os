@echo off
@set b2ousername=%1%
cls
title batch2os - System Update
:main
cls
echo --System Update-----------------------------------------------------------------------------------------------------
echo # Updates through batch2os are not yet supported, however you can download them at "github.com/batch2os/batch2os". #
echo #                                                                                                                  #
echo # 1: Go to the GitHub page                                                                                         #
echo # 2: Back                                                                                                          #
echo --------------------------------------------------------------------------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 start https://www.github.com/batch2os/batch2os
if %ERRORLEVEL%==2 goto back
:back
cls
cd C:\Program Files\batch2os\apps\config
call main.bat %b2ousername%
exit
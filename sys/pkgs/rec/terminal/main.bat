@echo off
cls
title batch2os - terminal
color 0c
echo batch2os terminal
echo Copyright (c) 2022 Aiden P. All rights reserved.
echo Use the command "web" to go to the author's website.
:command
cd C:\Program Files\batch2os\sys\pkgs\rec\terminal\commands\
set/p "commandtest=Enter a command: "
if NOT EXIST "%commandtest%" goto command-fail
call %commandtest%
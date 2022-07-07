@echo off
cls
color 6f
:main
cls
echo ++System Transfer++++++++++++++++++++++++++++++++++++++
echo + Insert the flash drive you inserted back at step 3. +
echo + Press any key to continue...                        +
echo ++++++++++++++++++++++++++++++++++++++++++++Step 6/?+++
pause >nul
cls
echo ++System Transfer++++++++++++++++++++++++++++++
echo + Enter the letter of the drive you inserted. +
echo + List of available drives:                   +
if EXIST A: echo + A:                                          +
if EXIST B: echo + B:                                          +  
if EXIST D: echo + D:                                          +
if EXIST E: echo + E:                                          +
if EXIST F: echo + F:                                          +
if EXIST G: echo + G:                                          +
if EXIST H: echo + H:                                          +
echo ++++++++++++++++++++++++++++++++++++Step 7/?+++
set/p "option="
%option%
cd transferdata
rmdir C:\"program files"\batch2os\config /s /q
xcopy config C:\"Program Files"\batch2os\ /E
C:
cd C:\"Program Files"\batch2os\
if NOT EXIST config goto error
goto complete
:error
cls
echo An error has occurred.
echo System settings are corrupted.
echo Regenerating system settings...
mkdir config
cd config
mkdir setupnotcomplete
mkdir users
echo Regenerated system settings.
:error1
pause >nul
goto error1
:complete
cls
echo ++System Transfer++++++++++++++++
echo + Complete! Rebooting system... +
echo +++++++++++++++++++++++++++++++++
rmdir C:\"Program Files
call C:\"Program Files"\batch2os\bootloader.bat
exit
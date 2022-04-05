@echo off
cls
title batch2os Setup Wizard
:main
cls
color 3f
echo __Setup Wizard_______________________________
echo ! Ready to install batch2os? You will need: !
echo ! 1. An internet connection                 !
echo ! 2. Git version control software           !
echo !                                           !
echo ! 1: Install                                !
echo ! 2: Update (not yet supported)             !
echo ! 3: Uninstall                              !
echo ________________________________batch2os SE__
echo.
echo __Hint__________________________________________________________________
echo ! Press the number key that corresponds to the option you want to use. !
echo ! Text with "#:" at the start are options.                             !
echo !                                                                      !
echo ! Hint 2                                                               !
echo ! If you push a number key and the system beeps, it it not an option.  !
echo ________________________________________________________________________
choice /c 1 /n
if %ERRORLEVEL%==1 goto install
if %ERRORLEVEL%==2 goto update
if %ERRORLEVEL%==3 goto uninstall
:install
cls
echo __Setup Wizard_______________________________
echo ! Step 1 of 4: Choose batch2os version      !
echo !                                           !
echo ! Choose which version you want:            !
echo ! 1: Full version                           !
echo ! 2: Minimal version (Not yet supported)    !
echo _____________________________________________
choice /c 1 /n
if %ERRORLEVEL%==1 goto install-full
:install-full
cls
echo __Setup Wizard_______________________________
echo ! Step 2 of 4: Download batch2os            !
echo !                                           !
echo ! Currently downloading from batch2os repo  !
echo _____________________________________________
echo.
echo __Git Log__
mkdir %temp%\batch2os
cd %temp%\batch2os
git clone github.com/batch2os/batch2os-full-data
ren batch2os-full-data batch2os
cd batch2os
cls
echo __Setup Wizard_______________________________
echo ! Step 3 of 4: Copy files                   !
echo !                                           !
echo ! Setup is currently creating directories   !
echo _____________________________________________
mkdir C:\"Program Files"\batch2os
cd C:\Program Files\batch2os
mkdir apps
mkdir apps\config
mkdir apps\config\backup-and-restore
mkdir apps\config\transfer
mkdir apps\config\update
mkdir apps\config\users
mkdir apps\dashboard
mkdir apps\games
mkdir apps\games\edupack
mkdir apps\games\edupack\math
mkdir apps\games\edupack\math\addition
mkdir apps\games\edupack\math\division
mkdir apps\games\edupack\math\multiplication
mkdir apps\games\edupack\math\subtraction
mkdir apps\logon
mkdir apps\utilities
mkdir apps\utilities\store
mkdir apps\utilities\store\database\
mkdir apps\utilities\store\database\games
mkdir apps\utilities\store\database\utils
mkdir config
mkdir config\users
mkdir sys
mkdir sys\drivers\
mkdir sys\drivers\disp
mkdir sys\pkgs
mkdir sys\pkgs\rec
mkdir sys\pkgs\rec\apps
mkdir sys\pkgs\rec\apps\backup\
mkdir sys\pkgs\rec\terminal
cls
echo __Setup Wizard______________________________
echo ! Step 3 of 4: Copy files                  !
echo !                                          !
echo ! Setup is currently copying bootloader... !
echo ____________________________________________
cd %temp%\batch2os\batch2os\
xcopy bootloader.bat C:\"Program Files"\batch2os\
cls
echo __Setup Wizard______________________________
echo ! Step 3 of 4: Copy files                  !
echo !                                          !
echo ! Setup is currently copying kernel...     !
echo ____________________________________________
xcopy kernel.bat C:\"Program Files"\batch2os\
cls
echo __Setup Wizard_______________________________
echo ! Step 3 of 4: Copy files                   !
echo !                                           !
echo ! Setup is currently copying app "logom"... !
echo _____________________________________________
cd apps\logon\
xcopy main.bat C:\"Program Files"\batch2os\apps\logon\
cls
echo __Setup Wizard___________________________________
echo ! Step 3 of 4: Copy files                       !
echo !                                               !
echo ! Setup is currently copying app "dashboard"... !
echo _________________________________________________
cd ..\dashboard
xcopy main.bat C:\"Program Files"\batch2os\apps\dashboard\
xcopy power.bat C:\"Program Files"\batch2os\apps\dashboard\
cls
echo __Setup Wizard___________________________________
echo ! Step 3 of 4: Copy files                       !
echo !                                               !
echo ! Setup is currently copying app "config"...    !
echo _________________________________________________
cd ..\config
xcopy main.bat C:\"Program Files"\batch2os\apps\config\
cd backup-and-restore
xcopy main.bat C:\"Program Files"\batch2os\apps\config\backup-and-restore\
cd ..\transfer
xcopy main.bat C:\"Program Files"\batch2os\apps\config\transfer\
cd ..\update
xcopy main.bat C:\"Program Files"\batch2os\apps\config\update\
cd ..\users
xcopy main.bat C:\"Program Files"\batch2os\apps\config\users\
cls
echo __Setup Wizard___________________________________
echo ! Step 3 of 4: Copy files                       !
echo !                                               !
echo ! Setup is currently copying app "edupack"...   !
echo _________________________________________________
cd ..\..\games\edupack
xcopy main.bat C:\"Program Files"\batch2os\apps\games\edupack\
cd math
xcopy main.bat C:\"Program Files"\batch2os\apps\games\edupack\math\
cd addition
xcopy main.bat C:\"Program Files"\batch2os\apps\games\edupack\math\addition\
cd ..\division
xcopy main.bat C:\"Program Files"\batch2os\apps\games\edupack\math\division\
cd ..\multiplication
xcopy main.bat C:\"Program Files"\batch2os\apps\games\edupack\math\multiplication\
cd ..\subtraction
xcopy main.bat C:\"Program Files"\batch2os\apps\games\edupack\math\subtraction\
cls
echo __Setup Wizard___________________________________
echo ! Step 3 of 4: Copy files                       !
echo !                                               !
echo ! Setup is currently copying app "store"...     !
echo _________________________________________________
cd ..\..\..\..\utilities\store\
xcopy main.bat C:\"Program Files"\batch2os\apps\utilities\store\
cls
echo __Setup Wizard___________________________________
echo ! Step 3 of 4: Copy files                       !
echo !                                               !
echo ! Setup is currently copying app "recovery"...  !
echo _________________________________________________
cd ..\..\..\sys\pkgs\rec\
xcopy main.bat C:\"Program Files"\batch2os\sys\pkgs\rec\
cd apps\backup\
xcopy main.bat C:\"Program Files"\batch2os\sys\pkgs\rec\apps\backup\
cd ..\..\terminal\
xcopy main.bat C:\"Program Files"\batch2os\sys\pkgs\rec\terminal\
cd ..\..\..\drivers\disp\
cls
echo __Setup Wizard_____________________________
echo ! Step 3 of 4: Copy files                 !
echo !                                         !
echo ! Setup is currently copying drivers...   !
echo ___________________________________________
xcopy batbox.exe C:\"Program Files"\batch2os\sys\drivers\disp\
cls
echo __Setup Wizard___________________
echo ! Step 4 of 4: Finalizing Setup !
echo _________________________________
cd C:\
mklink /g batch2os-short C:\"Program Files"\batch2os

set SCRIPT="%temp%\batch2os\%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\batch2os.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\batch2os-short\bootloader.bat" >> %SCRIPT%
echo oLink.IconLocation = "C:\batch2os-short\icon.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

cls
echo __Setup Wizard_______________________________
echo ! batch2os has been successfully installed. !
echo _____________________________________________
timeout /t 5 >nul
exit

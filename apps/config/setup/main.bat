@echo off
cls
title batch2os Setup
:main
cls
color 3f
echo Welcome to batch2os!
echo The windows in batch2os don't look like this,
pause
cls
echo --Welcome to batch2os!-----------------------------
echo # they look like this! Anyways, let's get set up. #
echo # Press any key to continue...                    #
echo ---------------------------------------------------
pause >nul
:main2
cls
echo --batch2os Setup-------------------------------------
echo # Do you have batch2os installed on another device? #
echo # 1: Yes                                            #
echo # 2: No                                             #
echo -----------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto transfertothisdevice
if %ERRORLEVEL%==2 goto main3
:main3
cls
echo --New User-----------
echo # Enter a username: #
echo ---------------------
set/p "usernametest="
cd C:\"Program Files"\batch2os\config\users\
mkdir "%usernametest%"
cd "%usernametest%"
mkdir apps
mkdir config
mkdir data
cls
echo --New User--------------
echo # User setup complete! #
echo ------------------------
pause >nul
cls
echo --New User--------------------------------------
echo # You can set up more users later in Settings. #
echo # Press any key to continue...                 #
echo ------------------------------------------------
pause >nul
:main4
cls
echo --Welcome to batch2os!----------------
echo # Setup has been completed.          #
echo # Would you like a tour of batch2os? #
echo # 1: Yes                             #
echo # 2: No                              #
echo --------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto tour
if %ERRORLEVEL%==2 goto exitsetup
:exitsetup
cls
echo Please wait, batch2os is rebooting...
cd C:\"Program Files"\batch2os\
call bootloader.bat
exit
:tour
cls
echo --batch2os Tour---------------------------------------------------------------------------------------------
echo # Mouse support in the Batch programming language is almost impossible, so in batch2os, mouses don't work. #
echo # This means that all of the buttons are usually controlled by the number keys on your keyboard.           #
echo # Press any key to continue...                                                                             #
echo ------------------------------------------------------------------------------------------------------------
pause >nul
cls
echo --batch2os Tour------------------------------------------------------------------------
echo # You'll notice that batch2os takes up your entire screen.                            #
echo # If you want to shrink it to only a window, hold the Alt key and press Enter/Return. #
echo # Please note this may break longer windows, like this one.                           #
echo # Press any key to continue...                                                        #
echo ---------------------------------------------------------------------------------------
pause >nul
:tour2a
cls
echo --batch2os Tour-------------------------------------------------------------------------------------
echo # Because of the limits of the Batch programming language, sometimes, apps will not have a border. #
echo # 1: Switch to borderless mode                                                                     #
echo # 2: Continue with the tour                                                                        #
echo ----------------------------------------------------------------------------------------------------
choice /c 12 /n
if %ERRORLEVEL%==1 goto tour2b
if %ERRORLEVEL%==2 goto tour3
:tour2b
cls
echo batch2os Tour
echo Because of the limits of the Batch programming language, sometimes, apps will not have a border.
echo Press any key to switch back to windowed mode...
pause >nul
goto tour2a
:tour3
cls
echo --batch2os Tour------------------------------------------------------------------
echo # If you want more apps for your batch2os system, go to the batch2os App Store. #
echo # Step 1: Go to the "Utilities" menu on your batch2os dashboard                 #
echo # Step 2: Press the 1 key                                                       #
echo # (Note: Usually, the App Store will require a database update after setup. To  #
echo #  do that, open the App Store and go into Settings.)                           #
echo # Press any key to continue...                                                  #
echo ---------------------------------------------------------------------------------
cls
echo --batch2os Tour---------------------------------------------------------------------------------------------------
echo # Apps that are downloaded through the App Store are found under the "Downloaded Apps" section on the dashboard. #
echo # Press any key to continue...                                                                                   #
echo ------------------------------------------------------------------------------------------------------------------
pause >nul
goto exitsetup
:transfertothisdevice
cls
echo --System Transfer-----------------------------------
echo # Start up the source computer and start batch2os. #
echo # Then, log in and open the Utilities menu.        #
echo # Press any key to continue...                     #
echo -----------------------------------------Step 1/?--- 
pause >nul
cls
echo --System Transfer---------------
echo # Open the Settings app.       #
echo # Then, open the System menu.  #
echo # After that, press 1.         #
echo # Press any key to continue... #
echo ---------------------Step 2/?---
pause >nul
:transfertothisdevice2
cls
echo --System Transfer------------------------------
echo # Select "Transfer to another device".        #
echo # Insert a flash drive.                       #
echo # Enter the drive letter of your flash drive. #
echo # Press any key to continue...                #
echo ------------------------------------Step 3/?---
pause >nul
cls
echo --System Transfer------------------------------------
echo # Select either "Transfer and erase" or "Transfer". #
echo # Press any key to continue...                      #
echo ------------------------------------------Step 4/?---
pause >nul
cls
echo --System Transfer----------------------------------------------------
echo # Let the transfer complete. This should only take a few seconds... #
echo # Press any key to continue...                                      #
echo ----------------------------------------------------------Step 5/?---
pause >nul
:transfertothisdevice3
cls
echo --System Transfer------------------------------------------------
echo # The system will now restart and open the System Transfer app. #
echo -----------------------------------------------------------------
cd C:\Program Files\batch2os\sys\pkgs\rec\apps\transfer\
call transferto-2.bat
exit

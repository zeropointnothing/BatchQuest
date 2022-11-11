@echo off

::PLACEHOLDER

title SelfCheck
::Checks whether or not it needs to start setup.
echo Checking BqS . . .

timeout 1 /nobreak >nul

if exist fr goto suc1
if not exist fr goto stUp

:suc1
echo.
echo Setup is Complete.

timeout 1 /nobreak >nul

echo.
echo Checking for Game Data . . .

timeout 1 /nobreak >nul
::looks for data.loc, which contains the directory of the DATA folder, which was inputed by the user during set up.
if exist data.loc goto suc2
if not exist data.loc goto err


:suc2
::Sets the variable 'datLoc' to the location found in data.loc. This is then used to find locChk, a file create during setup to indicate if game files exist in the given location.
echo.
echo ...
set /p datLoc=<data.loc
timeout 1 /nobreak >nul
echo.
echo Found Game Files location. Searching for files . . .
timeout 1 /nobreak >nul
if exist %datLoc%DATA\locChk goto suc3
if not exist %datLoc%DATA\locChk goto atpFix


:suc3
echo.
echo Game Files found. Copying data.loc . . .
timeout 1 /nobreak >nul
copy "%datLoc%data.loc" "%datLoc%DATA\data.loc"
echo SelfCheck complete.
timeout 1 /nobreak >nul
echo Files are located at %datLoc%DATA
echo.
pause
echo.
title Starting . . .
echo Starting BatchQuest.
timeout 2 /nobreak >nul
cls
call %datLoc%DATA\phs1.bat
exit


:err
::Informs the user that an error occurred, and to refer to the GitHub Wiki for assistance on how to fix.
cls
color 4
echo.
echo.
echo.
echo -ERROR-
echo.
echo err_data_nf
echo [check GitHub Error's Wiki Page for assistance]
echo.
pause
exit


::Starts the BatchQuest setup process, which determines where the DATA folder will be, moves the main scripts there, and creates two files.
::1. fr - This is the FirstRun file, which informs the BqS that setup has already been completed and to skip it. This is to prevent things from breaking.
::2. data.loc - This will contain the user inputed directory for the location of the DATA folder. A second copy of this file will be created in the DATA folder for the main scripts if needed.
::Both files MUST be in the same folder as the BqS
:stUp
echo.
echo BatchQuest has not been set up. Initializing Setup Process . . .
timeout 2 /nobreak >nul


cls
title Setup
echo Welcome To the BatchQuest Setup!
timeout 2 /nobreak >nul
echo.
echo This automated process will only happen once and is used to prepare BatchQuest's scripts for use.
echo.
pause

timeout 1 /nobreak >nul
echo.
echo Please Wait . . .
cls
echo 1>fr
echo Created FirstRun.
timeout 1 /nobreak >nul
cls
echo Setting up DATA Folder . . .
timeout 1 /nobreak >nul

set dataLoc=%~dp0
echo %dataLoc%>data.loc

echo . . .
timeout 1 /nobreak >nul

echo 1>%dataLoc%DATA\locChk
timeout 1 /nobreak >nul
cls
echo Checking Game Scripts . . .

timeout 1 /nobreak >nul
if exist %dataLoc%DATA\phs1.bat goto compl if not goto err

:compl
cls
echo Setup Complete! Re-open BatchQuest to start!
echo.
pause
exit

:atpFix
::Will attempt to fix the data.loc file to contain the correct location.

cls
echo.
echo ERROR: DATA folder not found. Attempting to fix . . .

timeout 1 /nobreak >nul

set dataLoc=%~dp0
echo %dataLoc%>data.loc
echo.
echo BqS located at %dataLoc%.
echo.
echo Attempting to find Game Data . . .
timeout 2 /nobreak >nul

if exist %dataLoc%DATA\locChk goto atpSuc
if not exist %dataLoc%DATA\locChk goto err

:atpSuc

echo.
echo GAME DATA FOUND. RESUMING SELFCHECK

timeout 1 /nobreak >nul

cls
goto suc2

exit

@echo off



if exist data.loc goto start
if not exist data.loc goto noStUp

:start
title BatchQuest
echo BatchQuest is best played in fullscreen mode.
echo.
pause

goto menu
:noStUp
echo BatchQuest requires files that you may not have. Please make sure to run BatchQuest.bat to safely start the game.
echo.
pause
exit


:menu
cls
echo Welcome To . . .
timeout 2 /nobreak >nul


echo       :::::::::      ::: ::::::::::: ::::::::  :::    :::                               ::::::::   :::    ::: :::::::::: :::::::: ::::::::::: 
echo      :+:    :+:   :+: :+:   :+:    :+:    :+: :+:    :+:                              :+:    :+:  :+:    :+: :+:       :+:    :+:    :+:      
echo     +:+    +:+  +:+   +:+  +:+    +:+        +:+    +:+                              +:+    +:+  +:+    +:+ +:+       +:+           +:+       
echo    +#++:++#+  +#++:++#++: +#+    +#+        +#++:++#++         +#++:++#++:++        +#+    +:+  +#+    +:+ +#++:++#  +#++:++#++    +#+        
echo   +#+    +#+ +#+     +#+ +#+    +#+        +#+    +#+                              +#+    +#+  +#+    +#+ +#+              +#+    +#+         
echo  #+#    #+# #+#     #+# #+#    #+#    #+# #+#    #+#                              #+#    #+#  #+#    #+# #+#       #+#    #+#    #+#          
echo #########  ###     ### ###     ########  ###    ###                               ########### ########  ########## ########     ###           
echo.
echo.

:mOpt
echo 1- New Game
echo 2- Load Game
echo 3- Settings
echo 4- Exit
echo.
set /p mChs=

if '%mChs%'=='1' goto nwGame
if '%mChs%'=='2' goto ldGame
if '%mChs%'=='3' goto sett
if '%mChs%'=='4' goto exit

:: sends if user gives an invalid response
echo.
echo %mChs% is not a valid option!
timeout 1 /nobreak >nul
goto mOpt

:ldGame
echo.
echo This feature has not been developed yet. . .
pause
goto menu

:sett
cls
echo --------- SETTINGS ---------
echo 1. Go to BQ GitHub
echo 2. Reset BQ (Deletes all non-starting data!)
echo.
set /p setAns=

if '%setAns%'=='1' goto GitHub
if '%setAns%'=='2' exit

cls
goto sett


:nwGame
echo.
echo Are you sure? Starting a new game will erase any existing save data.
set /p nwgAns=

if '%nwgAns%'=='y' goto gameStart
if '%nwgAns%'=='n' goto menu

:exit
exit

:GitHub
start https://github.com/ZeroPointNothing/BatchQuest
goto menu


:gameStart
cls
echo There's nothing here yet...
pause
exit

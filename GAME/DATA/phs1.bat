@echo off



    if exist data.loc (
        set /p datLoc=<data.loc
        title BatchQuest
        echo BatchQuest is best played in fullscreen mode.
        echo.
        pause
        goto menu
    )

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
    set mChs=
    set /p mChs=

setlocal enabledelayedexpansion


if '%mChs%'=='4' goto exit
if '%mChs%'=='1' (
    cls
    :nwGame
    echo.
    set nwgAns=
    echo Are you sure? Starting a new game will erase any existing save data.
    set /p nwgAns=
    
    if '!nwgAns!'=='y' goto gameStart
    if '!nwgAns!'=='n' goto menu
    cls
    goto nwGame
)

if '%mChs%'=='2' (
    :ldGame
    echo.
    echo This feature has not been developed yet. . .
    pause
    goto menu
)

if '%mChs%'=='3' (
    :sett
    cls
    echo --------- SETTINGS ---------
    echo 1. Go to BQ GitHub
    echo 2. Reset BQ -Deletes all non-starting data-
    echo 3. Go back
    echo.
    set /p setAns=
    
    if '!setAns!'=='1' goto GitHub
    if '!setAns!'=='2' (
        cls
        echo Reseting BatchQuest . . .
        echo -Please do not interrupt this process, as it can break your game-
        
        
        del data.loc
        timeout 1 /nobreak >nul
        del fr
        timeout 1 /nobreak >nul
        del !datLoc!\DATA\data.loc
        timeout 1 /nobreak >nul
        del !datLoc!\DATA\locChk
        

        echo.
        echo RESET COMPLETE.
        echo.
        setlocal disabledelayedexpansion
        echo Restart BatchQuest? -y/n-
        set /p rstAns=
        setlocal enabledelayedexpansion
        if /I '!rstAns!'=='y' (
            cls
            echo Restarting BatchQuest . . .
            timeout 2 /nobreak >nul
            cls
            call !datLoc!BatchQuest.bat
        )

        if /I '!rstAns!'=='n' (
            cls
            echo Exiting.
            echo Goodbye.
            timeout 3 /nobreak >nul
            exit
        )

    )
    if '!setAns!'=='3' goto menu

    cls
    goto sett
)

:: sends if user gives an invalid response
echo.
echo %mChs% is not a valid option!
timeout 1 /nobreak >nul
goto mOpt


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

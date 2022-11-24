@echo off
::set canRun=True
    if not '%canRun%'=='True' (
        echo Hey! You shouldn't run the script file directly! Please use the BatchQuest.bat file instead!
        echo.
        pause
        exit
    )


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

::MAIN MENUs

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
    
    if '!nwgAns!'=='y' (
        set gmeLoc=%~dp0
        if exist !gmeLoc!SAVE\Loc.sve (
            del !gmeLoc!SAVE\Loc.sve
        )
        if exist !gmeLoc!SAVE\char.sve (
            del !gmeLoc!SAVE\char.sve
        )
    cls
    goto gameStart
    )
    if '!nwgAns!'=='n' goto menu
    cls
    goto nwGame
)

setlocal enabledelayedexpansion
if '%mChs%'=='2' (
    :ldGame
    echo.
    set gmeLoc=%~dp0
    echo Searching for game save...
    timeout 2 /nobreak >nul
    if exist !gmeLoc!SAVE\Loc.sve (
        echo Save Data found. Loading...
        timeout 1 /nobreak >nul
        ::Loads data from specific files:
        set /p ldLoc=<!gmeLoc!SAVE\Loc.sve
        set /p char=<!gmeLoc!SAVE\char.sve
        set canLoad=True
        cls
        call !gmeLoc!script.bat
    ) ELSE (
        echo Unable to find save data. Please verify that it exists or start a new game.
        echo.
        pause
        goto menu
    )
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
        @RD /S /Q "!datLoc!DATA\SAVE"
        

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
call %datLoc%DATA\script.bat

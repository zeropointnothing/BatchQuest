@echo off



if exist data.loc goto start
if not exist data.loc goto noStUp

:start
title BatchQuest
echo BatchQuest is best played in fullscreen mode.
echo.
pause
cls

goto menu
:noStUp
echo BatchQuest requires files that you may not have. Please make sure to run BatchQuest.bat to safely start the game.
echo.
pause
exit


:menu
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
pause
exit

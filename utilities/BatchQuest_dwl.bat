@echo off
::Is the repo ready?
set ready=true
::Change 'ready' when the downloader can be used.

if '%ready%'=='true' goto dwl if not goto noRepo

:noRepo
title Wait!
echo.
echo This Downloader is not ready yet! Trying to use it will only result in errors. Please set this up before attempting to use it! (Check code.)
pause
exit


::Download Process
:dwl
echo Attempting To Download . . .
title Downloading . . .
powershell -Command "Invoke-WebRequest https://github.com/ZeroPointNothing/BatchQuest/archive/refs/heads/Content.zip -Outfile Content.zip"
echo Done
timeout 1 /nobreak >nul
cls
title Unzipping . . .
echo Attempting To Unzip . . .

powershell -Command "Expand-Archive Content.zip"
del Content.zip
echo Done
timeout 1 /nobreak >nul
cls
echo Final Touches . . .
title Please Wait
rename Content BatchQuest
timeout 1 /nobreak >nul
cls
echo Installation Complete.
echo.
pause

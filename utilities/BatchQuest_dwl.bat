@echo off
::Is the repo ready?
set ready=false
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
powershell -Command "Invoke-WebRequest [add link to repo] -Outfile [add file name]"
echo Done
timeout 1 /nobreak >nul
title Unzipping . . .
echo Attempting To Unzip . . .

powershell -Command "Expand-Archive [add file name]"
del main.zip
echo Done
title Complete!
pause
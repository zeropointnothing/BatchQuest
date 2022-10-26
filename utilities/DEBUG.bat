@echo off
title Debug Tool
echo Starting Debug Setup.
echo.
pause

echo.
echo Creating DATA Folder . . .
echo.
md DATA
timeout 1 /nobreak >nul
echo DATA Folder Created. 
timeout 1 /nobreak >nul
echo.
echo Creating FirstRun . . .
echo 1>fr
timeout 1 /nobreak >nul
echo.
echo FirstRun Created.
timeout 1 /nobreak >nul
echo.
echo Creating data.loc . . .
echo Enter location of GAME folder:
set /p loc=
echo.
echo %loc%>data.loc
echo Data.loc created.
timeout 1 /nobreak >nul
echo.
echo Creating locChk . . .
timeout 1 /nobreak >nul
echo 1>%loc%\DATA\locChk
echo.
echo locChk Created.
echo.
echo Debug Setup Complete.
echo.
pause
exit

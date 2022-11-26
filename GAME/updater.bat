@echo off
set loc=%~dp0
echo Downloading New BqS Script...
timeout 2 /nobreak >nul
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/ZeroPointNothing/BatchQuest/Content/GAME/BatchQuest.bat -Outfile BatchQuest.temp"
cls
echo Downloading New Menu Script...
timeout 2 /nobreak >nul
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/ZeroPointNothing/BatchQuest/Content/GAME/DATA/menu.bat -Outfile menu.temp"
cls
echo Downloading New Script(s)...
timeout 2 /nobreak >nul
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/ZeroPointNothing/BatchQuest/Content/GAME/DATA/script.bat -Outfile script.temp"
timeout 3 /nobreak >nul

cls
echo Deleting old files...
del BatchQuest.bat
del %loc%DATA\menu.bat
del %loc%DATA\script.bat
timeout 2 /nobreak >nul

cls
echo Setting up new files...
rename "BatchQuest.temp" "BatchQuest.bat"
rename "menu.temp" "menu.bat"
rename "script.temp" "script.bat"
timeout 2 /nobreak >nul
move "menu.bat" "%loc%DATA\menu.bat"
move "script.bat" "%loc%DATA\script.bat"
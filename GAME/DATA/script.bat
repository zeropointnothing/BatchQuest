@echo off
setlocal disabledelayedexpansion
goto start

::----PREDETERMINED PAUSES (USE call :[pause in seconds] TO USE)----
:p1
    timeout 1 /nobreak >nul
    goto :eof
:p2
    timeout 2 /nobreak >nul
    goto :eof
:p3
    timeout 3 /nobreak >nul
    goto :eof
::--------

:start

cls
echo [It was a dark and quiet night in the forest's of Tek'yr... Not even crows dared caw to interrupt it.]
call :p3
echo [And this, my friend, is where our story begins...]




pause
exit
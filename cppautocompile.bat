@echo off
title AutoCompile
color F0 >nul
chcp 65001 >nul  
call :banner

cd /d "%~dp1"  >nul 2>&1  REM Change to the directory of the dragged file

set "filename=%~n1"  REM Extract filename without extension
echo Compiling: %filename%.cpp

g++ -o "%filename%.exe" "%filename%.cpp"

if exist "%filename%.exe" (
    echo Compilation successful. Running the program...
    
    echo  [36m╔═════════════════════════════════════════════════════════╗[0m
    echo  [36m║                   Program Output                        ║[0m
    echo  [36m╠═════════════════════════════════════════════════════════╣[0m

    echo.
    "%filename%.exe"
    echo.
    echo.
    echo  [36m╚═════════════════════════════════════════════════════════╝[0m

    move "%filename%.exe" "C:\Users\vasan\Desktop\ccctraining\programs" >nul 2>&1
) else (
    echo Compilation failed! Check for errors.
)

pause


:banner
echo  ▄▄▄· ▄• ▄▌▄▄▄▄▄       ▄▄·       • ▌ ▄ ·.  ▄▄▄·▪  ▄▄▌  ▄▄▄ .
echo ▐█ ▀█ █▪██▌•██  ▪     ▐█ ▌▪▪     ·██ ▐███▪▐█ ▄███ ██•  ▀▄.▀·
echo ▄█▀▀█ █▌▐█▌ ▐█.▪ ▄█▀▄ ██ ▄▄ ▄█▀▄ ▐█ ▌▐▌▐█· ██▀·▐█·██▪  ▐▀▀▪▄
echo ▐█ ▪▐▌▐█▄█▌ ▐█▌·▐█▌.▐▌▐███▌▐█▌.▐▌██ ██▌▐█▌▐█▪·•▐█▌▐█▌▐▌▐█▄▄▌
echo  ▀  ▀  ▀▀▀  ▀▀▀  ▀█▄▀▪·▀▀▀  ▀█▄▀▪▀▀  █▪▀▀▀.▀   ▀▀▀.▀▀▀  ▀▀▀ 
exit /b

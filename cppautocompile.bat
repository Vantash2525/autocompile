@echo off
title AutoCompile
color F0 >nul
chcp 65001 >nul  
call :banner


if "%~1"=="" (
    
    echo Opening %filename%.cpp in Notepad++...
    start notepad++ new.cpp 
    exit /b
)



cd /d "%~dp1"  >nul 2>&1  REM Change to the directory of the dragged file

set "filename=%~n1"  REM Extract filename without extension
echo Compiling: %filename%.cpp


:compile

	g++ -o "%filename%.exe" "%filename%.cpp" 2>"%filename%.log"

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
		if not exist "%~dp1\programs" mkdir "%~dp1\programs"
		move "%filename%.exe" "%~dp1\programs" >nul 2>&1


	)else (
		echo Compilation failed! Check for errors.
		echo  [31m╔═════════════════════════════════════════════════════════╗[0m
		echo  [31m║                   Compilation Error                     ║[0m
		echo  [31m╠═════════════════════════════════════════════════════════╣[0m

		echo.
		type "%filename%.log"
		echo.
		echo.
		echo  [31m╚═════════════════════════════════════════════════════════╝[0m
		
		if not exist "%~dp1\errors" mkdir "%~dp1\errors"
		move "%filename%.log" "%~dp1\errors" >nul 2>&1
		
		echo [33m║ Enter any key to open the file ║[0m
		pause >nul
		notepad++ "%filename%.cpp"
		echo [33m║ If you corrected the error just press any key ║[0m
		pause >nul
		
		goto compile
		
		
	)
	


pause
exit /b 



:banner
echo  ▄▄▄· ▄• ▄▌▄▄▄▄▄       ▄▄·       • ▌ ▄ ·.  ▄▄▄·▪  ▄▄▌  ▄▄▄ .
echo ▐█ ▀█ █▪██▌•██  ▪     ▐█ ▌▪▪     ·██ ▐███▪▐█ ▄███ ██•  ▀▄.▀·
echo ▄█▀▀█ █▌▐█▌ ▐█.▪ ▄█▀▄ ██ ▄▄ ▄█▀▄ ▐█ ▌▐▌▐█· ██▀·▐█·██▪  ▐▀▀▪▄
echo ▐█ ▪▐▌▐█▄█▌ ▐█▌·▐█▌.▐▌▐███▌▐█▌.▐▌██ ██▌▐█▌▐█▪·•▐█▌▐█▌▐▌▐█▄▄▌
echo  ▀  ▀  ▀▀▀  ▀▀▀  ▀█▄▀▪·▀▀▀  ▀█▄▀▪▀▀  █▪▀▀▀.▀   ▀▀▀.▀▀▀  ▀▀▀ 
exit /b

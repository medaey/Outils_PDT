:menu
	cls
	color 0b
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    echo                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    echo                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    echo                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    echo                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    echo                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	echo                                       Pavé numérique au démarrage
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                                         Version : %version%
	echo.
	echo.
	echo Executer depuis : %~dp0
	echo ╔══════════════════════════════════════════╗
	echo ║ 1  Activer pavé numérique au démarrage   ║ 
	echo ╠──────────────────────────────────────────╣
	echo ║ 2  Désactiver pavé numérique au démarrage║
	echo ╠════════════════════╦═════════════════════╣
	echo ║ Q: Quitter         ║ . Retour            ║
	echo ╚════════════════════╩═════════════════════╝
	echo Que voulez-vous faire ?
	set NUMLOCK_CHOIX=""
	set /p NUMLOCK_CHOIX= 
	IF "%NUMLOCK_CHOIX%"=="1" goto :enable
	IF "%NUMLOCK_CHOIX%"=="2" goto :disable
	IF "%NUMLOCK_CHOIX%"=="r" goto :back
	IF "%NUMLOCK_CHOIX%"=="R" goto :back
	IF "%NUMLOCK_CHOIX%"=="." goto :back
	IF "%NUMLOCK_CHOIX%"=="q" goto :end
	IF "%NUMLOCK_CHOIX%"=="Q" goto :end
	IF "%NUMLOCK_CHOIX%"==""  goto :menu
	goto :menu

:enable
	cls
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2" /f /t reg_SZ
	reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	pause
	goto :menu

:disable
	cls
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2147483648" /f /t reg_SZ
	reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	pause
	goto :menu

:back
	call %MAIN_WORKFLOW%

:end
	endlocal
	exit
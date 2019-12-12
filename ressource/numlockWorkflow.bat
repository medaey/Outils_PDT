:menu
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    ECHO                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    ECHO                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    ECHO                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    ECHO                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    ECHO                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	ECHO                                       Pavé numérique au démarrage
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : %version%
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0
	ECHO ──────────────────────────────────────────
	ECHO  1: Activer pavé numérique au démarrage
	ECHO ──────────────────────────────────────────
	ECHO  2: Désactiver pavé numérique au démarrage
	ECHO ──────────────────────────────────────────
	ECHO  R: Retour au menu principal
	ECHO ──────────────────────────────────────────
	ECHO  Q: Quitter
	ECHO ──────────────────────────────────────────
	ECHO Quel programme voulez-vous exécuter ?
	SET NUMLOCK_CHOIX=
	SET /p NUMLOCK_CHOIX= 
	IF /i "%NUMLOCK_CHOIX%" == "1" GOTO :enable
	IF /i "%NUMLOCK_CHOIX%" == "2" GOTO :disable
	IF /i "%NUMLOCK_CHOIX%" == "r" GOTO :back
	IF /i "%NUMLOCK_CHOIX%" == "R" GOTO :back
	IF /i "%NUMLOCK_CHOIX%" == "q" GOTO :end
	IF /i "%NUMLOCK_CHOIX%" == "Q" GOTO :end
	IF /i "%NUMLOCK_CHOIX%" == ""  GOTO :menu
	GOTO :menu

:enable
	CLS
	REG add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2" /f /t REG_SZ
	REG QUERY "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	PAUSE
	GOTO :menu

:disable
	CLS
	REG add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2147483648" /f /t REG_SZ
	REG QUERY "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	PAUSE
	GOTO :menu

:back
	CALL %MAIN_WORKFLOW%

:end
	ENDLOCAL
	EXIT
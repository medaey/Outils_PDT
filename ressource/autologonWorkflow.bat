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
	ECHO                                                Autologon               
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : %version%
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0
	ECHO ─────────────────────────────────────────────────────────────────────────────────────────
	ECHo  Autologon est un systéme d'identification automatique.
	ECHO  L'utilisateur n'aura plus a saisir sont NOM D'UTILISATEUR ni sont MOT DE PASSE
	ECHO ──────────────────────────────────────────────────────────────────────────────────────────
	ECHO  1: Activée
	ECHO ────────────────────────────
	ECHO  2: Désactiver
	ECHO ────────────────────────────
	ECHO  R: Retour
	ECHO ────────────────────────────
	ECHO  Q: Quitter
	ECHO ────────────────────────────
	ECHO Quel programme voulez-vous exécuter ?
	SET LOGON_CHOIX=
	SET /p LOGON_CHOIX=
	IF /i "%LOGON_CHOIX%" == "1" GOTO :enable
	IF /i "%LOGON_CHOIX%" == "2" GOTO :disable
	IF /i "%LOGON_CHOIX%" == "r" GOTO :back
	IF /i "%LOGON_CHOIX%" == "R" GOTO :back
	IF /i "%LOGON_CHOIX%" == "q" GOTO :end
	IF /i "%LOGON_CHOIX%" == "Q" GOTO :end
	IF /i "%LOGON_CHOIX%" == "" GOTO :menu
	GOTO :menu

:enable
	CLS
	ECHO %DOMAINE_NAME% 
	SET /p nom= Saisir le nom utilisateur de la session : 
	SET /p psw= Saisir le mot de passe de la session : 
	SET /p dmn= Saisire le nom de domaine : 
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "1" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /d "%NOM%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "%PSW%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName" /d "%DMN%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "FORceAutoLogon" /d "1" /f /t REG_SZ
	ECHO username = %NOM%
	ECHO password = %PSW%
	ECHO domaine = %DMN%
	PAUSE
	GOTO :menu

:disable
	CLS
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "0" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "FORceAutoLogon" /d "0" /f /t REG_SZ
	ECHO Autologon [Désactiver]
	PAUSE
	GOTO :menu

:back
CALL %MAIN_WORKFLOW%

:end
	ENDLOCAL
	EXIT

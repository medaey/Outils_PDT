:menu
	cls
	COLOR 0b
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    echo                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    echo                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    echo                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    echo                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    echo                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	echo                                                Autologon               
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                                         Version : %version%
	echo.
	echo.
	echo Executer depuis : %~dp0
	echo ╔════════════════════════════════════════════════════════════════════════════════╗
	echo ║ Autologon est un systéme d'identification automatique.                         ║
	echo ║ L'utilisateur n'aura plus a saisir sont NOM D'UTILISATEUR ni sont MOT DE PASSE ║
	echo ╠────────────────────────────────────────────────────────────────────────────────╣
	echo ║ 1  Activée                                                                     ║
	echo ║────────────────────────────────────────────────────────────────────────────────╣
	echo ║ 2  Désactiver                                                                  ║
	echo ╠════════════════════════════════════════╦═══════════════════════════════════════╣
	echo ║ Q: Quitter                             ║ . Retour                              ║
	echo ╚════════════════════════════════════════╩═══════════════════════════════════════╝
	echo Que voulez-vous faire ?
	set LOGON_CHOIX=""
	set /p LOGON_CHOIX=
	if "%LOGON_CHOIX%"=="1" goto :enable
	if "%LOGON_CHOIX%"=="2" goto :disable
	if "%LOGON_CHOIX%"=="r" goto :back
	if "%LOGON_CHOIX%"=="R" goto :back
	if "%LOGON_CHOIX%"=="." goto :back
	if "%LOGON_CHOIX%"=="q" goto :end
	if "%LOGON_CHOIX%"=="Q" goto :end
	if "%LOGON_CHOIX%"=="" goto :menu
	goto :menu

:enable
	cls
	echo %DOMAINE_NAME% 
	set /p nom= Saisir le nom utilisateur de la session : 
	set /p psw= Saisir le mot de passe de la session : 
	set /p dmn= Saisire le nom de domaine : 
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "1" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /d "%NOM%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "%PSW%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName" /d "%DMN%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "FORceAutoLogon" /d "1" /f /t REG_SZ
	echo username = %NOM%
	echo password = %PSW%
	echo domaine = %DMN%
	pause
	goto :menu

:disable
	cls
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "0" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "FORceAutoLogon" /d "0" /f /t REG_SZ
	echo Autologon [Désactiver]
	pause
	goto :menu

:back
call %MAIN_WORKFLOW%

:end
	endlocal
	exit
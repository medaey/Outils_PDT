:menu
:: ►◄─│┌┐└┘├┤┬┴┼═║╔╗╚╝╠╣╦╩╬ 
	cls
	color 0b
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    echo                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    echo                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    echo                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    echo                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    echo                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	echo                                                Page (1/1)
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                                         Version : %version%
	echo.
	echo.
	echo Executer depuis : %~dp0
	echo ╔════════╦═════════════════════════════════╗
	if exist "%AUTO_LOGON_WORKFLOW%" (set "workflowStatus=►  OK ") else set "workflowStatus=  FAIL"
	echo ║%workflowStatus%  │ 1 Gérer l'Autologon             ║
	echo ╠────────┼─────────────────────────────────╣
	if exist "%NETWORK_WORKFLOW%" (set "workflowStatus=►  OK ") else set "workflowStatus=  FAIL"
	echo ║%workflowStatus%  │ 2 Réparer le services réseau HS ║
	echo ╠────────┼─────────────────────────────────╣
	if exist "%NUMLOCK_WORKFLOW%" (set "workflowStatus=►  OK ") else set "workflowStatus=  FAIL"
	echo ║%workflowStatus%  │ 3 Pavé numérique au démarrage   ║
	echo ╠────────┼─────────────────────────────────╣
	if exist "%SOFTWARE_WORKFLOW%" (set "workflowStatus=►  OK ") else set "workflowStatus=  FAIL"
	echo ║%workflowStatus%  │ 4 Installer un logiciel         ║
	echo ╠════════╩═════╦════════════╦══════════════╣
	echo ║  Q: Quitter  │ 0: Options │ ?: À propos  ║
	echo ╚══════════════╩════════════╩══════════════╝
	echo Que voulez-vous faire ?
	set workflowFile=""
	set /p workflowFile=
	if "%workflowFile%"=="1" set "workflowFile=%AUTO_LOGON_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="2" set "workflowFile=%NETWORK_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="3" set "workflowFile=%NUMLOCK_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="4" set "workflowFile=%SOFTWARE_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="4" set "workflowFile=%SOFTWARE_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="o" set "workflowFile=%OPTIONS_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="O" set "workflowFile=%OPTIONS_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="0" set "workflowFile=%OPTIONS_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="?" set "workflowFile=%ABOUT_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="," set "workflowFile=%ABOUT_WORKFLOW%" & goto :checkExistFile
	if "%workflowFile%"=="q" goto :end
	if "%workflowFile%"=="Q" goto :end
	if "%workflowFile%"=="" goto :menu
	goto :menu

:checkExistFile
	if exist "%workflowFile%" (call "%workflowFile%") else goto :fileMissingError

:fileMissingError
	cls
	color 0C
	echo ██████████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█████████████████████████████████████
	echo █████████████████████████████████████  ▲ Fichier introuvable ▲  ████████████████████████████████████
	echo ██████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█████████████████████████████████████
	echo  %workflowFile%                                                                                    
	echo                    Télécharger le fichier: https://github.com/leghort/Outils_PDT
	echo ────────────────────────────────────────────────────────────────────────────────────────────────────
	pause
	goto :menu

:end
	endlocal
	exit
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
	ECHO                                                Page (1/1)
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : %version%
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0
	ECHO ───────────────────────────────────────
	IF EXIST "%AUTO_LOGON_WORKFLOW%" (
		ECHO  [OK]  1: Gérer l'Autologon
	) ELSE ECHO [FAIL] 1: Gérer l'Autologon
	ECHO ───────────────────────────────────────
	IF EXIST "%NETWORK_WORKFLOW%" (
		ECHO  [OK]  2: Réparer le services réseau HS
	) ELSE ECHO [FAIL] 2: Réparer le services réseau HS
	ECHO ───────────────────────────────────────
	IF EXIST "%NUMLOCK_WORKFLOW%" (
		ECHO  [OK]  3: Pavé numérique au démarrage
	) ELSE ECHO [FAIL] 3: Pavé numérique au démarrage
	ECHO ───────────────────────────────────────
	ECHO  0: À propos
	ECHO ───────────────────────────────────────
	ECHO  Q: Quitter
	ECHO ───────────────────────────────────────
	ECHO Quel programme voulez-vous exécuter ?
	SET mainChoise=
	SET /p mainChoise=
	IF /i "%mainChoise%" == "1" SET "workflowFile=%AUTO_LOGON_WORKFLOW%" & GOTO :checkExistFile
	IF /i "%mainChoise%" == "2" SET "workflowFile=%NETWORK_WORKFLOW%" & GOTO :checkExistFile
	IF /i "%mainChoise%" == "3" SET "workflowFile=%NUMLOCK_WORKFLOW%" & GOTO :checkExistFile
	IF /i "%mainChoise%" == "o" SET "workflowFile=%OPTION_WORKFLOW%" & GOTO :checkExistFile
	IF /i "%mainChoise%" == "O" SET "workflowFile=%OPTION_WORKFLOW%" & GOTO :checkExistFile
	IF /i "%mainChoise%" == "0" SET "workflowFile=%OPTION_WORKFLOW%" & GOTO :checkExistFile
	IF /i "%mainChoise%" == "q" GOTO :end
	IF /i "%mainChoise%" == "Q" GOTO :end
	IF /i "%mainChoise%" == "" GOTO :menu
	GOTO :menu

:checkExistFile
	IF EXIST "%workflowFile%" (
		CALL "%workflowFile%"
	) ELSE GOTO :fileMissingError

:fileMissingError
	CLS
	COLOR 0C
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	ECHO                                     /!\ Fichier introuvable /!\
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	ECHO  %workflowFile%
	ECHO.
	ECHO                    Télécharger le fichier: https://github.com/leghort/Outils_PDT
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	PAUSE
	GOTO :menu

:ressourceFolderError
	CLS
	COLOR 0C
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	ECHO.                                   /!\ Dossier introuvable /!\
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	ECHO  %RESSOURCE_FOLDER%
	ECHO.
	ECHO                    Télécharger le fichier: https://github.com/leghort/Outils_PDT
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	PAUSE
	GOTO :end

:back
	CALL %MAIN_WORKFLOW%

:end
	ENDLOCAL
	EXIT
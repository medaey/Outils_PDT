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
	ECHO                                                Options
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : %version%
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0 
	ECHO ──────────────────────────────
REM	ECHO  1: Mettre à jour l'Outils_PDT
REM	ECHO ──────────────────────────────
	ECHO  0: A propos
	ECHO ──────────────────────────────
	ECHO  R: Retour au menu principal
	ECHO ──────────────────────────────
	ECHO Quel programme voulez-vous exécuter ?
	SET OPT_CHOIX=
	SET /p OPT_CHOIX=
REM	IF /i "%OPT_CHOIX%" == "u" GOTO :update
	IF /i "%OPT_CHOIX%" == "0" GOTO :info
	IF /i "%MAIN_CHOIX%" == "o" GOTO :info
	IF /i "%MAIN_CHOIX%" == "O" GOTO :info
	IF /i "%OPT_CHOIX%" == "r" GOTO :back
	IF /i "%OPT_CHOIX%" == "R" GOTO :back
	IF /i "%OPT_CHOIX%" == "" GOTO :menu
	GOTO :menu

:update
	CLS
	IF EXIST %TEMP_FOLDER%master.zip (
		DEL /s %TEMP_FOLDER%master.zip
	)
	CLS
	%RESS_FOLDER%wget.exe -P %TEMP_FOLDER% https://github.com/leghort/Outils_PDT/archive/master.zip
	IF ERRORLEVEL 1 (GOTO :ERREUR_OPT_UPDATE)
	IF NOT EXIST %TEMP_FOLDER%master.zip (
		GOTO :ERREUR_OPT_UPDATE
	)
	%RESS_FOLDER%7z.exe x %TEMP_FOLDER%master.zip -o%TEMP_FOLDER% -aoa
	XCOPY %TEMP_FOLDER%Outils_PDT-master /y %MAIN_FOLDER% /e /i
	CLS
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	ECHO Mise à jour Terminée
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	PAUSE
	GOTO :menu

:info
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    ECHO                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    ECHO                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    ECHO                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    ECHO                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    ECHO                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	ECHO                                       A propos de Outils_PDT[ALL]
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : %version%
	EChO Site du projet : https://github.com/leghort/Outils_PDT
	ECHO ─────────────────────────────
	ECHO Auteur  : Médéric Cossu
	ECHO           mederic@cossu.tech
	ECHO License : Open source GPL-3.0
	ECHO ─────────────────────────────
	PAUSE
	GOTO :menu

:ERREUR_OPT_UPDATE
	CLS	
	COLOR 0C
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	ECHO Une erreur s'est produite durant le téléchargement.
	ECHo Merci de vérifier votre connecter à internet.
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	PAUSE
	GOTO :menu

:back
	CALL %MAIN_WORKFLOW%
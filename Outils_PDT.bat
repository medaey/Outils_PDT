@ECHO off
SETLOCAL
CHCP 65001 > nul
MODE con cols=100 lines=40
TITLE Boite A Outils Technicien Poste De Travail                                                  By M.Cossu

:: Définir les constantes
SET "MAIN_FOLDER=%~dp0"
SET "RESSOURCE_FOLDER=%~dp0ressource\"
SET "TEMP_FOLDER=%~dp0temp"
SET "MAIN_WORKFLOW=%RESSOURCE_FOLDER%mainWorkflow.bat"
SET "AUTO_LOGON_WORKFLOW=%RESSOURCE_FOLDER%autologonWorkflow.bat"
SET "NETWORK_WORKFLOW=%RESSOURCE_FOLDER%networkWorkflow.bat"
SET "NUMLOCK_WORKFLOW=%RESSOURCE_FOLDER%numlockWorkflow.bat"
SET "ABOUT_WORKFLOW=%RESSOURCE_FOLDER%aboutWorkflow.bat"
SET "ERROR_WORKFLOW=%RESSOURCE_FOLDER%errorWorkflow.bat"
SET "SOFTWARE_WORKFLOW=%RESSOURCE_FOLDER%softwareWorkflow.bat"
SET "OPTIONS_WORKFLOW=%RESSOURCE_FOLDER%optionsWorkflow.bat"

:: Définir les variables
SET "version=1.1.8"

:POWER_UP_ADMIN
CD /D %~dp0
if NOT EXIST "getadmin.vbs" (
    MODE con lines=2 cols=30
    ECHO Set UAC = CreateObject^("Shell.Application"^)>getadmin.vbs
    ECHO UAC.ShellExecute %0, "", "", "runas", 1 >>getadmin.vbs
    CALL WSCRIPT getadmin.vbs
    EXIT
    )
DEL getadmin.vbs

:checkAdmin
	CLS
	ATTRIB %WINDIR%\system32 -h | FINDSTR /I "system32" >nul
	IF %ERRORLEVEL% NEQ 1 (
	COLOR 0C
	ECHO ████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀████████████████████
	ECHO ███████████████████  ▲ Ce script doit etre Exécuter en tant qu'Administrateur ▲  ███████████████████
	ECHO ████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄████████████████████
	PAUSE
	GOTO :end
    )

IF EXIST %TEMP_FOLDER% (RMDIR /S /Q %TEMP_FOLDER% & MKDIR %TEMP_FOLDER% & ATTRIB +h +s %TEMP_FOLDER%) ELSE MKDIR %TEMP_FOLDER% & ATTRIB +h +s %TEMP_FOLDER%
SYSTEMINFO | FINDSTR /B /C:"Domain">%TEMP_FOLDER%/domain.tmp & SET /p DOMAINE_NAME=<%TEMP_FOLDER%/domain.tmp

IF NOT EXIST %RESSOURCE_FOLDER% (GOTO :ressourceFolderError)
CALL %MAIN_WORKFLOW%

:ressourceFolderError
	CLS
	COLOR 0C
	ECHO ██████████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█████████████████████████████████████
	ECHO █████████████████████████████████████  ▲ Dossier introuvable ▲  ████████████████████████████████████
	ECHO ██████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█████████████████████████████████████
	ECHO  %RESSOURCE_FOLDER%
	ECHO.
	ECHO                    Télécharger le fichier: https://github.com/leghort/Outils_PDT
	ECHO ────────────────────────────────────────────────────────────────────────────────────────────────────
	PAUSE
	GOTO :end

:end
	ENDLOCAL
	EXIT
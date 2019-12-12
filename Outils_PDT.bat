@ECHO off
SETLOCAL
CHCP 65001 > nul
MODE con cols=100 lines=40
TITLE Boite A Outils Technicien Poste De Travail                                                  By M.Cossu

REM Définir les constante
SET "MAIN_FOLDER=%~dp0"
SET "RESSOURCE_FOLDER=%~dp0ressource\"
SET "TEMP_FOLDER=%TMP%\Outils_PDT.tmp\"
SET "MAIN_WORKFLOW=%RESSOURCE_FOLDER%mainWorkflow.bat"
SET "AUTO_LOGON_WORKFLOW=%RESSOURCE_FOLDER%autologonWorkflow.bat"
SET "NETWORK_WORKFLOW=%RESSOURCE_FOLDER%networkWorkflow.bat"
SET "NUMLOCK_WORKFLOW=%RESSOURCE_FOLDER%numlockWorkflow.bat"
SET "OPTION_WORKFLOW=%RESSOURCE_FOLDER%aboutWorkflow.bat"
SET "ERROR_WORKFLOW=%RESSOURCE_FOLDER%errorWorkflow.bat"

rem Définir les variables
SET version=1.1.7

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
	ECHO ────────────────────────────────────────────────────────────────
	ECHO. /!\ Ce script doit etre Exécuter en tant qu'Administrateur /!\
	ECHO ────────────────────────────────────────────────────────────────
	PAUSE
	GOTO :end
    )

IF NOT EXIST "%RESSOURCE_FOLDER%" (
	GOTO :ressourceFolderError
)
IF NOT EXIST %TMP% (
	 MKDIR %TMP%
)
IF NOT EXIST %TEMP_FOLDER% (
	MKDIR %TEMP_FOLDER%
) ELSE DEL /S /Q %TEMP_FOLDER%

CLS
SYSTEMINFO | FINDSTR /B /C:"Domain">%TEMP_FOLDER%domaine_name
ECHO %MAIN_FOLDER%>%TEMP_FOLDER%MAIN_FOLDER
ECHO %RESSOURCE_FOLDER%>%TEMP_FOLDER%res_folder
SET /p RESSOURCE_FOLDER_TMP=<%TEMP_FOLDER%res_folder
SET /p DOMAINE_NAME=<%TEMP_FOLDER%domaine_name

CALL %MAIN_WORKFLOW%
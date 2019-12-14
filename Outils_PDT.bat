@echo off
setlocal
chcp 65001 > nul
mode con cols=100 lines=40
title Boite A Outils Technicien Poste De Travail                                                  By M.Cossu

:: Définir les constantes
set "MAIN_FOLDER=%~dp0"
set "RESSOURCE_FOLDER=%~dp0ressource\"
set "TEMP_FOLDER=%~dp0temp"
set "MAIN_WORKFLOW=%RESSOURCE_FOLDER%mainWorkflow.bat"
set "AUTO_LOGON_WORKFLOW=%RESSOURCE_FOLDER%autologonWorkflow.bat"
set "NETWORK_WORKFLOW=%RESSOURCE_FOLDER%networkWorkflow.bat"
set "NUMLOCK_WORKFLOW=%RESSOURCE_FOLDER%numlockWorkflow.bat"
set "ABOUT_WORKFLOW=%RESSOURCE_FOLDER%aboutWorkflow.bat"
set "ERROR_WORKFLOW=%RESSOURCE_FOLDER%errorWorkflow.bat"
set "SOFTWARE_WORKFLOW=%RESSOURCE_FOLDER%softwareWorkflow.bat"
set "OPTIONS_WORKFLOW=%RESSOURCE_FOLDER%optionsWorkflow.bat"

:: Définir les variables
set "version=1.1.8"

:POWER_UP_ADMIN
cd /D %~dp0
if not exist "getadmin.vbs" (
    mode con lines=2 cols=30
    echo set UAC = CreateObject^("Shell.Application"^)>getadmin.vbs
    echo UAC.ShellExecute %0, "", "", "runas", 1 >>getadmin.vbs
    call wscript getadmin.vbs
    exit
    )
del getadmin.vbs

:checkAdmin
	cls
	attrib %WINDIR%\system32 -h | findstr /I "system32" >nul
	if %ERRORLEVEL% NEQ 1 (
	color 0C
	echo ████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀████████████████████
	echo ███████████████████  ▲ Ce script doit etre Exécuter en tant qu'Administrateur ▲  ███████████████████
	echo ████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄████████████████████
	pause
	goto :end
    )

if exist %TEMP_FOLDER% (rmdir /S /Q %TEMP_FOLDER% & mkdir %TEMP_FOLDER% & attrib +h +s %TEMP_FOLDER%) else mkdir %TEMP_FOLDER% & attrib +h +s %TEMP_FOLDER%
systeminfo | findstr /B /C:"Domain">%TEMP_FOLDER%/domain.tmp & set /p DOMAINE_NAME=<%TEMP_FOLDER%/domain.tmp

if not exist %RESSOURCE_FOLDER% (goto :ressourceFolderError)
call %MAIN_WORKFLOW%

:ressourceFolderError
	cls
	color 0C
	echo ██████████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█████████████████████████████████████
	echo █████████████████████████████████████  ▲ Dossier introuvable ▲  ████████████████████████████████████
	echo ██████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█████████████████████████████████████
	echo  %RESSOURCE_FOLDER%
	echo.
	echo                    Télécharger le fichier: https://github.com/leghort/Outils_PDT
	echo ────────────────────────────────────────────────────────────────────────────────────────────────────
	pause
	goto :end

:end
	endlocal
	exit
rem Auteur : mederic@cossu.tech
setlocal
@echo off
chcp437 > nul
@for %%n in (%0) do set fold=%%~dpn
title Boite A Outils Technicien Poste De Travail                                                  By M.Cossu
mode con cols=100 lines=40

:check_admin
	rem v‚rifier ci le script est bien ‚xecuter en Administrateur
		attrib %windir%\system32 -h | findstr /I "system32" >nul
		IF %errorlevel% neq 1 (
		color 0C
		echo.
		echo. /!\ Ce script doit etre Ex‚cuter en tant qu'Administrateur /!\
		echo.
		pause
		exit
       )

	color 0b
	rem Reparation d'une carte reseaux non detect‚e par windows 7
	cls
	echo.
	net localgroup administrateurs utilisateurs /add networkservice localservice
	echo.
	echo /!\ Attention c'ette action va red‚marrer l'ordinateur /!\
	echo.
	set /p question=Souhaitez vous continuez [O/N]?
	if /i not "%question%"=="O" goto :retour
	pause
	shutdown -r -t 5
	goto :fin

:retour
	endlocal
	exit /b 0

:fin
	endlocal
	exit
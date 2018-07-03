rem Auteur : mederic@cossu.tech
endlocal
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

:menu_logon
	color 0b
	cls
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 ÛÛÛÛÛ» ÛÛÛÛÛÛ» ÛÛÛ»   ÛÛÛ»ÛÛ»ÛÛÛ»   ÛÛ»
	echo                                ÛÛÉÍÍÛÛ»ÛÛÉÍÍÛÛ»ÛÛÛÛ» ÛÛÛÛºÛÛºÛÛÛÛ»  ÛÛº
	echo                                ÛÛÛÛÛÛÛºÛÛº  ÛÛºÛÛÉÛÛÛÛÉÛÛºÛÛºÛÛÉÛÛ» ÛÛº
	echo                                ÛÛÉÍÍÛÛºÛÛº  ÛÛºÛÛºÈÛÛÉ¼ÛÛºÛÛºÛÛºÈÛÛ»ÛÛº
	echo                                ÛÛº  ÛÛºÛÛÛÛÛÛÉ¼ÛÛº ÈÍ¼ ÛÛºÛÛºÛÛº ÈÛÛÛÛº
	echo                                ÈÍ¼  ÈÍ¼ÈÍÍÍÍÍ¼ ÈÍ¼     ÈÍ¼ÈÍ¼ÈÍ¼  ÈÍÍÍ¼
	echo                                                Autologon
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo.
	echo Executer depuis : %fold% 
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo 1: Activ‚e Autologon
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo 2: D‚sactiver Autologon
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo R: Retour au menu principal
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo Q: Quitter
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo.
	echo.
	set /p reponse="Quel programme voulez-vous executer ?"

	IF /i "%reponse%"=="1" goto :batch1
	IF /i "%reponse%"=="2" goto :batch2
	IF /i "%reponse%"=="r" goto :retour
	IF /i "%reponse%"=="R" goto :retour
	IF /i "%reponse%"=="q" goto :fin
	IF /i "%reponse%"=="Q" goto :fin
	IF /i "%reponse%"=="" goto :menu_logon
	goto :menu_logon

:batch1
	cls
	rem Active L'Autologon
	IF exist "%tmp%\nom_domaine.txt" (del /s %tmp%\nom_domaine.txt) else goto :control_1
	cls
	:control_1
	systeminfo | findstr /B /C:"Domain" > %tmp%\nom_domaine.txt
	set /p my_domaine=<%tmp%\nom_domaine.txt
	echo %my_domaine% 
	set /p nom= Saisir le nom utilisateur de la session : 
	set /p psw= Saisir le mot de passe de la session : 
	set /p dmn= Saisire le nom de domaine : 
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "1" /f /t REG_SZ
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /d "%nom%" /f /t REG_SZ
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "%psw%" /f /t REG_SZ
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName" /d "%dmn%" /f /t REG_SZ
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ForceAutoLogon" /d "1" /f /t REG_SZ
	echo username = %nom%
	echo password = %psw%
	echo domaine = %dmn%
	pause
	del /s /q %tmp%\nom_domaine.txt
	cls
	goto :menu_logon

:batch2
	cls
	rem D‚sactive l'Autologon
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "0" /f /t REG_SZ
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "" /f /t REG_SZ
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ForceAutoLogon" /d "0" /f /t REG_SZ
	pause
	cls
	goto :menu_logon

:retour
	endlocal
	exit /b 0

:fin
	endlocal
	exit
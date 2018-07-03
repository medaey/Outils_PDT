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

:menu
	color 0b
	IF exist "%fold%ressource" (echo Dossier "ressource" trouver.) else goto :erreur
	cls
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 ÛÛÛÛÛ» ÛÛÛÛÛÛ» ÛÛÛ»   ÛÛÛ»ÛÛ»ÛÛÛ»   ÛÛ»
	echo                                ÛÛÉÍÍÛÛ»ÛÛÉÍÍÛÛ»ÛÛÛÛ» ÛÛÛÛºÛÛºÛÛÛÛ»  ÛÛº
	echo                                ÛÛÛÛÛÛÛºÛÛº  ÛÛºÛÛÉÛÛÛÛÉÛÛºÛÛºÛÛÉÛÛ» ÛÛº
	echo                                ÛÛÉÍÍÛÛºÛÛº  ÛÛºÛÛºÈÛÛÉ¼ÛÛºÛÛºÛÛºÈÛÛ»ÛÛº
	echo                                ÛÛº  ÛÛºÛÛÛÛÛÛÉ¼ÛÛº ÈÍ¼ ÛÛºÛÛºÛÛº ÈÛÛÛÛº
	echo                                ÈÍ¼  ÈÍ¼ÈÍÍÍÍÍ¼ ÈÍ¼     ÈÍ¼ÈÍ¼ÈÍ¼  ÈÍÍÍ¼
	echo                                                Page (1/2)
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo.
	echo Executer depuis : %fold% 
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	IF exist "%fold%\ressource\autologon.bat" (echo  [OK]  1: G‚rer l'Autologon
		) else echo [FAIL] 1: G‚rer l'Autologon
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	IF exist "%fold%\ressource\restart_network.bat" (echo  [OK]  2: R‚parer le services r‚seau HS
		) else echo [FAIL] 2: R‚parer le services r‚seau HS
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	IF exist "%fold%\ressource\num_lock.bat" (echo  [OK]  3: Pav‚ num‚rique au d‚marrage
		) else echo [FAIL] 3: Pav‚ num‚rique au d‚marrage
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo Q: Quitter
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo.
	echo.
	echo.
	set /p reponse="Quel programme voulez-vous ex‚cuter ?"

	IF /i "%reponse%"=="1" goto :batch1
	IF /i "%reponse%"=="2" goto :batch2
	IF /i "%reponse%"=="3" goto :batch3
	IF /i "%reponse%"=="q" goto :fin
	IF /i "%reponse%"=="Q" goto :fin
	IF /i "%reponse%"=="" goto :menu
	goto :menu

:batch1
	cls
	IF exist "%fold%\ressource\autologon.bat" (call %fold%\ressource\autologon.bat
		) else goto :erreur_batch1
	cls
	goto :menu

:batch2
	cls
	IF exist "%fold%\ressource\restart_network.bat" (call %fold%\ressource\restart_network.bat
		) else goto :erreur_batch2
	cls
	goto :menu

:batch3
	cls
	call %fold%\ressource\num_lock.bat
	IF exist "%fold%\ressource\num_lock.bat" (call %fold%\ressource\num_lock.bat
		) else goto :erreur_batch3
	cls
	goto :menu

:erreur
	color 0C
	cls
	echo.
	echo.
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo  Le Dossier "%fold%ressource" n'a pu ˆtre trouv‚e!
	echo  Merci de v‚rifier que le Dossier "%fold%ressource"est bien pr‚sent
	echo  Ce Dossier contien tout les fonctionnalit‚ vous pouvais le t‚l‚chager sur :
	echo.
	echo source : https://github.com/leghort/Outils_PDT
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo.
	echo.
	pause
	cls
	goto :fin

:erreur_batch1
	color 0C
	cls
	echo.
	echo.
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo  Le fichier "%fold%ressource\autologon.bat" n'a pu ˆtre trouv‚e!
	echo  Merci de v‚rifier que le fichier "autologon.bat"
	echo  est bien pr‚sent dans "%fold%ressource"
	echo  (cette fontionnalit‚e ne sera pas disponible tant que le problŠme ne sera pas r‚solut)
	echo.
	echo source : https://github.com/leghort/Outils_PDT
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo.
	echo.
	pause
	goto :menu

:erreur_batch2
	color 0C
	cls
	echo.
	echo.
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo  Le fichier "%fold%ressource\num_lock.bat" n'a pu ˆtre trouv‚e!
	echo  Merci de v‚rifier que le fichier "num_lock.bat"
	echo  est bien pr‚sent dans "%fold%ressource"
	echo  (cette fontionnalit‚e ne sera pas disponible tant que le problŠme ne sera pas r‚solut)
	echo.
	echo source : https://github.com/leghort/Outils_PDT
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo.
	echo.
	pause
	goto :menu

:erreur_batch3
	color 0C
	cls
	echo.
	echo.
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo  Le fichier "%fold%ressource\restart_network.bat" n'a pu ˆtre trouv‚e!
	echo  Merci de v‚rifier que le fichier "restart_network.bat"
	echo  est bien pr‚sent dans "%fold%ressource"
	echo  (cette fontionnalit‚e ne sera pas disponible tant que le problŠme ne sera pas r‚solut)
	echo.
	echo source : https://github.com/leghort/Outils_PDT
	echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
	echo.
	echo.
	pause
	goto :menu

:fin
	endlocal
	exit
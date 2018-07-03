rem Auteur : mederic@cossu.tech
setlocal
@echo off
chcp437 > nul
@for %%n in (%0) do set fold=%%~dpn
title Boite A Outils Technicien Poste De Travail                                                  By M.Cossu
mode con cols=100 lines=40

:check_admin
	rem v�rifier ci le script est bien �xecuter en Administrateur
		attrib %windir%\system32 -h | findstr /I "system32" >nul
		IF %errorlevel% neq 1 (
		color 0C
		echo.
		echo. /!\ Ce script doit etre Ex�cuter en tant qu'Administrateur /!\
		echo.
		pause
		exit
       )

:menu
	color 0b
	IF exist "%fold%ressource" (echo Dossier "ressource" trouver.) else goto :erreur
	cls
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 ����ۻ �����ۻ ��ۻ   ��ۻ�ۻ��ۻ   �ۻ
	echo                                ������ۻ������ۻ���ۻ ���ۺ�ۺ���ۻ  �ۺ
	echo                                ������ۺ�ۺ  �ۺ���������ۺ�ۺ����ۻ �ۺ
	echo                                ������ۺ�ۺ  �ۺ�ۺ���ɼ�ۺ�ۺ�ۺ��ۻ�ۺ
	echo                                �ۺ  �ۺ������ɼ�ۺ �ͼ �ۺ�ۺ�ۺ ����ۺ
	echo                                �ͼ  �ͼ�����ͼ �ͼ     �ͼ�ͼ�ͼ  ���ͼ
	echo                                                Page (1/2)
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo.
	echo Executer depuis : %fold% 
	echo ���������������������������������������
	IF exist "%fold%\ressource\autologon.bat" (echo  [OK]  1: G�rer l'Autologon
		) else echo [FAIL] 1: G�rer l'Autologon
	echo ���������������������������������������
	IF exist "%fold%\ressource\restart_network.bat" (echo  [OK]  2: R�parer le services r�seau HS
		) else echo [FAIL] 2: R�parer le services r�seau HS
	echo ���������������������������������������
	echo Q: Quitter
	echo ���������������������������������������
	echo.
	echo.
	echo.
	set /p reponse="Quel programme voulez-vous ex�cuter ?"

	IF /i "%reponse%"=="1" goto :batch1
	IF /i "%reponse%"=="2" goto :batch2
	IF /i "%reponse%"=="3" goto :batch3
	IF /i "%reponse%"=="4" goto :batch4
	IF /i "%reponse%"=="5" goto :batch5
	IF /i "%reponse%"=="6" goto :batch6
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
	call %fold%\ressource\Mon_ping.bat
	cls
	goto :menu

:batch4
	cls
	call %fold%\ressource\Mon_ipconfig.bat 
	cls
	goto :menu

:batch5
	cls
	call %fold%\ressource\windows_update.bat
	cls
	goto :menu

:batch6
	cls
	call %fold%\ressource\nettoyage.bat
	cls
	goto :menu

:erreur
	cls
	echo Dossier "%fold%ressource" non trouver.
	pause
	cls
	goto :fin

:erreur_batch1
	color 0C
	cls
	echo.
	echo.
	echo ����������������������������������������������������������������������������������������������������
	echo  Le fichier "%fold%ressource\autologon.bat" n'a pu �tre trouv�e!
	echo  Merci de v�rifier que le fichier "autologon.bat"
	echo  est bien pr�sent dans "%fold%ressource"
	echo  (cette fontionnalit�e ne sera pas disponible tant que le probl�me ne sera pas r�solut)
	echo ����������������������������������������������������������������������������������������������������
	echo.
	echo.
	pause
	goto :menu

:erreur_batch2
	color 0C
	cls
	echo.
	echo.
	echo ����������������������������������������������������������������������������������������������������
	echo  Le fichier "%fold%ressource\restart_network.bat" n'a pu �tre trouv�e!
	echo  Merci de v�rifier que le fichier "restart_network.bat"
	echo  est bien pr�sent dans "%fold%ressource"
	echo  (cette fontionnalit�e ne sera pas disponible tant que le probl�me ne sera pas r�solut)
	echo ����������������������������������������������������������������������������������������������������
	echo.
	echo.
	pause
	goto :menu
:fin
	endlocal
	exit
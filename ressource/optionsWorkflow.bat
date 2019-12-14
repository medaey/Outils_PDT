:menu
	cls
	color 0b
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    echo                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    echo                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    echo                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    echo                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    echo                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	echo                                                Options
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                                         Version : %version%
	echo.
	echo.
	echo Executer depuis : %~dp0 
	echo ╔═════════════════════════════════════════╗
	echo ║ 1  Mises à jour [Outils_PDT]            ║
	echo ╠─────────────────────────────────────────╣
	echo ║ 2  Proxy                                ║
	echo ╠─────────────────────────────────────────╣
	echo ║ 3  Serveur Citrix                       ║
	echo ╠─────────────────────────────────────────╣
	echo ║ 4  Nom de Domaine                       ║
	echo ╠─────────────────────────────────────────╣
	echo ║ 5  Serveur d'impression                 ║
	echo ╠─────────────────────────────────────────╣
	echo ║ 6  Compte administateur local           ║
	echo ╠═════════════════════════════════════════╣
	echo ║ . Retour                                ║
	echo ╚═════════════════════════════════════════╝
	echo Quelle option voulez-vous modifier ?
	set OPT_CHOIX=""
	set /p OPT_CHOIX=
	if "%OPT_CHOIX%"=="1" goto :update
	if "%OPT_CHOIX%"=="r" goto :back
	if "%OPT_CHOIX%"=="R" goto :back
	if "%OPT_CHOIX%"=="." goto :back
	if "%OPT_CHOIX%"=="" goto :menu
	goto :menu

:update
	cls
	%RESS_FOLDER%wget.exe -P %TEMP_FOLDER% https://github.com/leghort/Outils_PDT/archive/master.zip
	cls
	echo ████████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██████████████████████████████████████
	echo ███████████████████████████████████  ▲ Mise à jour Terminée ▲  █████████████████████████████████████
	echo ████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄██████████████████████████████████████
	pause
	goto :menu

:ERREUR_OPT_UPDATE
	cls	
	color 0C
	echo █████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀██████████████████████
	echo ████████████████████  ▲ Une erreur s'est produite durant le téléchargement. ▲  █████████████████████
	echo █████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄██████████████████████
	pause
	goto :menu

:back
	call %MAIN_WORKFLOW%
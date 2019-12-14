:menu

set firefoxVersion=
for /f "delims=" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Mozilla Firefox" /v CurrentVersion') do @set "firefoxVersion=%%a"

set "firefoxSetupFile=Firefox Setup 71.0.exe"

	cls
	color 0b
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    echo                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    echo                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    echo                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    echo                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    echo                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	echo                                          Installer un logiciel               
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                                         Version : %version%
	echo.
	echo.
	echo Executer depuis : %~dp0
	echo ╔═══════════════════════════════════════════════════════════════╗
	echo ║ L'installateur de logiciel utilise des fichiers locaux,       ║
	echo ║ cela permet de réduire le temps d'installation des logiciels. ║
	echo ╠───────────────────────────────────────────────────────────────╣
	if "%firefoxVersion%"=="" (set "installedStatus=[Non-installer]") else set "installedStatus=    [Installer]"
	echo ║ 1  %firefoxSetupFile%                      %installedStatus%║
::	echo ╠───────────────────────────────────────────────────────────────╣
::	echo ║ 2  Java                                                       ║
::	echo ╠───────────────────────────────────────────────────────────────╣
::	echo ║ 3  Pdfcreator                                                 ║
::	echo ╠───────────────────────────────────────────────────────────────╣
::	echo ║ 4  Office 2010                                                ║
	echo ╠═══════════════════════════════╦═══════════════════════════════╣
	echo ║           Q: Quitter          ║            . Retour           ║
	echo ╚═══════════════════════════════╩═══════════════════════════════╝
	echo Quel programme voulez-vous installer ?
	set softwareFile=""
	set /p softwareFile=
		if "%softwareFile%"=="1" set "softwareFile=%firefoxSetupFile%" & goto :softwareCheck
::		if "%softwareFile%"=="2" set "softwareFile=Java" & goto :softwareSetup
::		if "%softwareFile%"=="3" set "softwareFile=Pdfcreator" & goto :softwareSetup
::		if "%softwareFile%"=="4" set "softwareFile=Office2010" & goto :softwareSetup
		if "%softwareFile%"=="r" goto :back
		if "%softwareFile%"=="R" goto :back
		if "%softwareFile%"=="." goto :back
		if "%softwareFile%"=="q" goto :end
		if "%softwareFile%"=="Q" goto :end
		if "%softwareFile%"=="" goto :menu
	goto :menu

:softwareCheck
::Vérifier si le fichier setup existe bien
	if not exist "%RESSOURCE_FOLDER%%softwareFile%" goto :fileMissing
	if "%softwareFile%"=="%firefoxSetupFile%" goto :firefoxCheck
	color 0C
	echo ███████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀███████████
	echo ██████████  ▲ Il n'y a pas de méthode pour vérifier ci ce programme est déja installer ▲  ██████████
	echo ███████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄███████████
	pause
	goto :menu

:firefoxCheck
	if "%firefoxVersion%"=="" (goto :softwareSetup) else goto :softwareAlreadyInstalled
	goto :menu

:: Installer le logiciel
:softwareSetup
	start "" "%RESSOURCE_FOLDER%%softwareFile%" /s /noreboot

:: Loading bar
:loading
	cls & echo Installation de %softwareFile% [....]
	ping 127.0.0.1 -n 2 >NUL
	cls & echo Installation de %softwareFile% [#...]
	ping 127.0.0.1 -n 2 >NUL
	cls & echo Installation de %softwareFile% [##..]
	ping 127.0.0.1 -n 2 >NUL
	cls & echo Installation de %softwareFile% [###.]
	ping 127.0.0.1 -n 2 >NUL
	cls & echo Installation de %softwareFile% [####]
	ping 127.0.0.1 -n 2 >NUL

	tasklist /FI "IMAGENAME eq %softwareFile%" 2>NUL | find /I /N "%softwareFile%">NUL
	if "%ERRORLEVEL%"=="0" goto :loading
	goto :menu

:fileMissing
	cls
	color 0C
	echo ██████████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█████████████████████████████████████
	echo █████████████████████████████████████  ▲ Fichier introuvable ▲  ████████████████████████████████████
	echo ██████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█████████████████████████████████████
	echo  %RESSOURCE_FOLDER%%softwareFile%
	echo ────────────────────────────────────────────────────────────────────────────────────────────────────
	pause
	goto :menu

:softwareAlreadyInstalled
	cls
	echo █████████████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀███████████████████████████████████████
	echo ████████████████████████████████████████  ▲ Déja installer ▲  ██████████████████████████████████████
	echo █████████████████████████████████████████▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄███████████████████████████████████████
	echo          %softwareFile% est déja installer sur cette machine.
	echo ────────────────────────────────────────────────────────────────────────────────────────────────────
	pause
	goto :menu

:back
	call %MAIN_WORKFLOW%

:end
	endlocal
	exit
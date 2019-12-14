:info
	cls
	color 0b
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    echo                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    echo                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    echo                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    echo                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    echo                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	echo                                        A propos de Outils_PDT
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                                         Version : %version%
	echo.
	echo.
	echo Site du projet : https://github.com/leghort/Outils_PDT
	echo ─────────────────────────────
	echo  Auteur : mederic@cossu.tech
	echo.
	echo License : Open source GPL-3.0
	echo ─────────────────────────────
	pause
	goto :back

:back
	call %MAIN_WORKFLOW%
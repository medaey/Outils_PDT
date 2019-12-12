:info
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗
    ECHO                                ██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║
    ECHO                                ███████║██║  ██║██╔████╔██║██║██╔██╗ ██║
    ECHO                                ██╔══██║██║  ██║██║╚██╔╝██║██║██║╚██╗██║
    ECHO                                ██║  ██║██████╔╝██║ ╚═╝ ██║██║██║ ╚████║
    ECHO                                ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝
	ECHO                                        A propos de Outils_PDT
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : %version%
	EChO Site du projet : https://github.com/leghort/Outils_PDT
	ECHO ─────────────────────────────
	ECHO Auteur  : Médéric Cossu
	ECHO           mederic@cossu.tech
	ECHO License : Open source GPL-3.0
	ECHO ─────────────────────────────
	PAUSE
	GOTO :back

:back
	CALL %MAIN_WORKFLOW%

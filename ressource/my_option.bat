:OPT_MENU
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 ЫЫЫЫЫ» ЫЫЫЫЫЫ» ЫЫЫ»   ЫЫЫ»ЫЫ»ЫЫЫ»   ЫЫ»
	ECHO                                ЫЫЙННЫЫ»ЫЫЙННЫЫ»ЫЫЫЫ» ЫЫЫЫєЫЫєЫЫЫЫ»  ЫЫє
	ECHO                                ЫЫЫЫЫЫЫєЫЫє  ЫЫєЫЫЙЫЫЫЫЙЫЫєЫЫєЫЫЙЫЫ» ЫЫє
	ECHO                                ЫЫЙННЫЫєЫЫє  ЫЫєЫЫєИЫЫЙјЫЫєЫЫєЫЫєИЫЫ»ЫЫє
	ECHO                                ЫЫє  ЫЫєЫЫЫЫЫЫЙјЫЫє ИНј ЫЫєЫЫєЫЫє ИЫЫЫЫє
	ECHO                                ИНј  ИНјИНННННј ИНј     ИНјИНјИНј  ИНННј
	ECHO                                                Options
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : 1.1.6
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0 
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO  1: Mettre … jour l'Outils_PDT
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO  R: Retour au menu principal
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO  Q: Quitter
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO  ?: A propos
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO Quel programme voulez-vous ex‚cuter ?
	SET OPT_CHOIX=
	SET /p OPT_CHOIX=
	IF /i "%OPT_CHOIX%" == "1" GOTO :OPT_UPDATE
	IF /i "%OPT_CHOIX%" == "?" GOTO :OPT_INFO
	IF /i "%OPT_CHOIX%" == "r" GOTO :RETOUR
	IF /i "%OPT_CHOIX%" == "R" GOTO :RETOUR
	IF /i "%OPT_CHOIX%" == "q" GOTO :FIN
	IF /i "%OPT_CHOIX%" == "Q" GOTO :FIN
	IF /i "%OPT_CHOIX%" == "" GOTO :OPT_MENU
	GOTO :OPT_MENU

:OPT_UPDATE
	CLS
	IF EXIST "%TEMP_FOLDER%"master.zip (
		DEL /s "%TEMP_FOLDER%"master.zip
	)
	CLS
	"%RESS_FOLDER%"wget.exe -P %TEMP_FOLDER% https://github.com/leghort/Outils_PDT/archive/master.zip
	IF ERRORLEVEL 1 (GOTO :ERREUR_OPT_UPDATE)
	IF NOT EXIST "%TEMP_FOLDER%"master.zip (
		GOTO :ERREUR_OPT_UPDATE
	)
	"%RESS_FOLDER%"7z.exe x "%TEMP_FOLDER%"master.zip -o"%TEMP_FOLDER%" -aoa
	XCOPY "%TEMP_FOLDER%Outils_PDT-master" /y "%MAIN_FOLDER%" /e /i
	CLS
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO Mise … jour Termin‚e
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	PAUSE
	GOTO :OPT_MENU

:OPT_INFO
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 ЫЫЫЫЫ» ЫЫЫЫЫЫ» ЫЫЫ»   ЫЫЫ»ЫЫ»ЫЫЫ»   ЫЫ»
	ECHO                                ЫЫЙННЫЫ»ЫЫЙННЫЫ»ЫЫЫЫ» ЫЫЫЫєЫЫєЫЫЫЫ»  ЫЫє
	ECHO                                ЫЫЫЫЫЫЫєЫЫє  ЫЫєЫЫЙЫЫЫЫЙЫЫєЫЫєЫЫЙЫЫ» ЫЫє
	ECHO                                ЫЫЙННЫЫєЫЫє  ЫЫєЫЫєИЫЫЙјЫЫєЫЫєЫЫєИЫЫ»ЫЫє
	ECHO                                ЫЫє  ЫЫєЫЫЫЫЫЫЙјЫЫє ИНј ЫЫєЫЫєЫЫє ИЫЫЫЫє
	ECHO                                ИНј  ИНјИНННННј ИНј     ИНјИНјИНј  ИНННј
	ECHO                                       A propos de Outils_PDT[ALL]
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : 1.1.6
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO Auteur  : M‚d‚ric Cossu
	ECHO           mederic@cossu.tech
	ECHO License : Open source GPL-3.0
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	PAUSE
	GOTO :OPT_MENU

:ERREUR_OPT_UPDATE
	CLS	
	COLOR 0C
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	ECHO Une erreur s'est produite durant le t‚l‚chargement.
	ECHo Merci de v‚rifier que votre connecter … internet.
	ECHO ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
	PAUSE
	GOTO :OPT_MENU

:RETOUR
	CALL "%MAIN_FOLDER%\outils_PDT[ALL].bat"

:FIN
	ENDLOCAL
	EXIT
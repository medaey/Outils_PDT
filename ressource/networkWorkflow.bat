NET LOCALGROUP administrateurs utilisateurs /add networkservice localservice
CLS
COLOR 0b
ECHO ─────────────────────────────────────────────────────────────
ECHO /!\ Attention c'ette action va redémarrer l'ordinateur /!\
ECHO ─────────────────────────────────────────────────────────────
SET /p question=Souhaitez vous continuez [O/N]?
IF /i NOT "%question%"=="O" GOTO :back
SHUTDOWN -r -t 5
GOTO :end

:back
	CALL %MAIN_WORKFLOW%

:end
	ENDLOCAL
	EXIT
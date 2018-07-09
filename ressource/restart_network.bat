NET LOCALGROUP administrateurs utilisateurs /add networkservice localservice
CLS
COLOR 0b
ECHO 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
ECHO /!\ Attention c'ette action va red굆arrer l'ordinateur /!\
ECHO 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
SET /p question=Souhaitez vous continuez [O/N]?
IF /i NOT "%question%"=="O" GOTO :RETOUR
SHUTDOWN -r -t 5
GOTO :FIN

:FIN
	ENDLOCAL
	EXIT
@ECHO OFF

:Echos 
ECHO Would you like to run rps-win.rb?
ECHO Press C to continue, or press Q to quit.
EXIT

CALL :Echos

:Detect_Key_Press
CHOICE CcQq
IF %errorlevel%==1 ruby rps-win.rb REM  GOTO
IF %errorlevel%==2 ruby rps-win.rb REM  GOTO
IF %errorlevel%==3 EXIT REM  GOTO
IF %errorlevel%==4 EXIT REM  GOTO
EXIT

CALL :Detect_Key_Press
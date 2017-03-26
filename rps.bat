@ECHO OFF

:master
	ECHO "Would you like to run the `rps-win.rb` file?"
	ECHO "Note: you must have Ruby installed. If you don't, read the `README.md` file on Github for this repo for more info."
	:choose
		CHOICE /C YN
		IF %ERRORLEVEL%==1 CALL:process
		IF %ERRORLEVEL%==2 CALL:exiting
	GOTO:EOF
	:process
		START cmd.exe /K rps-win.rb
	GOTO:EOF
	:exiting
		EXIT
	GOTO:EOF
GOTO:EOF

CALL:master

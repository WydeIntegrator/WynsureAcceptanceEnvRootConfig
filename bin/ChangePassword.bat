@ECHO OFF
CALL "%~dp0eWAM Set Env.bat"
CALL %Wyde-Root%\bin\ewamconsole /ERRORMESSAGE:FALSE /DEBUGTRAP:FALSE /run:aCnT_PasswordModifier.ChangePasswords /WFAPPLINAME:WynsureSolution_FR /RUNCONTEXTNAME:WynsurePostgreSQLAcceptanceFR
PAUSE
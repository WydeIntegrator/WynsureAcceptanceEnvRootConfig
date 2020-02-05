@ECHO ON
@call "%~dp0WydeServer Set Env.bat"
@SET WYDE-NETCONF=%WYDE-ADMIN%\WNETCONF_Client.ini

start %WYDESERVER-ROOT%\wwClient\WydeWeb.exe /service:wynsure /run:aWFApplicationLauncher.ExecuteAppli(WynsureSolution_FR)
pause
@exit

@ECHO OFF
call "%~dp0WydeServer Set Env.bat"
start %WYDESERVER-ROOT%\wsmServer\wyseman /port:%WYDESERVER-PORT% /uninstallservice /AUTHENTIFIEDADMIN:FALSE /NETCONF:%WYDE-NETCONF%
pause
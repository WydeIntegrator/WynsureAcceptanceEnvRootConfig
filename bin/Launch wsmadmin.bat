call "%~dp0WydeServer Set Env.bat"
ECHO start %WYDE-ROOT%\WydeServer\wwClient\wsmadmin /host:PocApp,%WYDESERVER-PORT% /AUTHENTIFIEDADMIN:FALSE
ECHO start %WYDE-ROOT%\WydeServer\wwClient\wsmadmin /host:PocApp,%WYDESERVER-PORT% /AUTHENTIFIEDADMIN:FALSE
start %WYDE-ROOT%\WydeServer\wwClient\wsmadmin /host:PocApp,%WYDESERVER-PORT% /AUTHENTIFIEDADMIN:FALSE
PAUSE
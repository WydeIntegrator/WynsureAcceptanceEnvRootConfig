@call "%~dp0eWAM set env.bat"
@start "" "%WYDE-ROOT%\bin\ewam.exe" /Run:aWFApplicationLauncher.Run @%WYDE-ADMIN%\WWNetConf.cfg
@exit
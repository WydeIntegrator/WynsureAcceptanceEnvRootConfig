@ECHO OFF

set PATH=%PATH%;C:\Program Files (x86)\Git\bin;C:\Program Files\Git\bin
CALL "%~dp0eWAM Set Env.bat"
CD /D %WF-ROOT%
git pull
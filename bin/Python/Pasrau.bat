@echo off
@call "%~dp0..\eWAM Set Env.bat"
python %WF-ROOT%\Python\PASRAU\Pasrau.py %WF-ROOT%\Batch\Out_Python\test_pasrau.json %WF-ROOT%\Batch\Out_Python\Out_Pasrau\
pause

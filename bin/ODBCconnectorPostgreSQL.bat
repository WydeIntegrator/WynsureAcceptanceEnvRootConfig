@ECHO OFF
@call "%~dp0ewam set env.bat"

SET WYNSUREODBCNAME=WYN%VERSION2%_BIR_FR
SET WYNSUREDBNAME=wyn%VERSION2%_bir_fr
SET DBSERVERNAME=TESTDBPG1
SET CONFIG=PostgreSQL Unicode(x64)
SET DESCRIPTION=Acceptance%VERSION% FR Dev (BIR team) database
SET USER=wydef%VERSION2%_bir_fr
SET PASS=wydecorp

odbcconf /A {CONFIGSYSDSN "%CONFIG%" "DSN=%WYNSUREODBCNAME%|Description=%DESCRIPTION%|SERVER=%DBSERVERNAME%|Database=%WYNSUREDBNAME%"}
REG ADD "HKLM\SOFTWARE\ODBC\ODBC.INI\%WYNSUREODBCNAME%" /f /v UID /t REG_SZ /d "%USER%"
REG ADD "HKLM\SOFTWARE\ODBC\ODBC.INI\%WYNSUREODBCNAME%" /f /v LastUser /t REG_SZ /d "%USER%"
REG ADD "HKLM\SOFTWARE\ODBC\ODBC.INI\%WYNSUREODBCNAME%" /f /v PWD /t REG_SZ /d "%PASS%"

PAUSE
REM SOME RULES :
REM When setting a variable using environment variables, please use quotes (") like that because they may contains space
REM Right : set "WF-ROOT=%WYDE-ROOT%"
REM Wrong : set WF-ROOT=%WYDE-ROOT%
REM Specially for PATH :
REM Right : set "PATH=%WYDE-ROOT%\bin;%PATH%"
REM Wrong : PATH %WYDE-ROOT%\bin;%PATH%

REM When testing an environment variable, always use quotes (")
REM Right : @if "%WF-ROOT%"==""
REM Wrong : @if %WF-ROOT%==""
@set WYDE-BINARY=64
@if "%WF-ROOT%"=="" set "WF-ROOT=%WYDE-ROOT%"
@set WYDE-TGV=%ENV-ROOT%\Tgv
@set WYDE-ERR=%ENV-ROOT%\Log
@set WYDE-NOTES=%ENV-ROOT%\Notes
@set WYDE-LICENSE=%ENV-ROOT%\Licence
@set WF-Tmp=%ENV-ROOT%\tmp
@set "WYDE-IMPEXP="
@set "WYDE-SYSTGV="
@set "WYDE-DEVTGV="
@rem the next line may be modified during the setup
@set "WYDE-REFDEVTGV="
@set "WYDE-TESTTGV="
@set "WYDE-SRC="
@set "WYDE-DLL=%ENV-ROOT%\CppDll"
@set "WYDE-HELP="
@set "WYDE-TUTORIAL="
@set "WYDE-NETCONF="
@set "WYDE-ADMIN=%ENV-ROOT%\Admin"
@set "WYDE-ASSEMBLIES="
@set "WF-BMP=%WF-ROOT%\wlibmp"
@set "WF-THEME=%WF-BMP%\PackageOriginal"
@set "WF-Word=%WF-ROOT%\Word"
@set "WF-Forms=%WF-ROOT%\Forms"
@set "WF-Help=%WF-ROOT%\helpwynsure"
@set "WF-Demo=%WF-ROOT%\demo"
@set "wyde-gsp=C:\Inetpub\wwwroot\Wynsure"
@set "wf-ecm="
@set "RTF2HTML_CONFIG_FILE=%WYDE-ADMIN%\html.conf"
@set "IN_APPLI=%WF-ROOT%\Demo\HealthDemo\FichierTestEDI\Reception"
@set "OUT_APPLI=%WF-ROOT%\Demo\HealthDemo\FichierTestEDI\Envoie"
@if "%GITPATH%"=="" set "GITPATH=C:\Program Files (x86)\Git\bin;C:\Program Files\Git\bin"

REM Set WinMergePath for Version Analyzer
@if "%WinMergePath%"=="" (
 @if exist "C:\Program Files (x86)\WinMerge\WinMergeU.exe" (
  @set "WinMergePath=C:\Program Files (x86)\WinMerge"
 )
)
REM We verify if we set WinMergePath, in case the file wasn't installed, before adding it in the PATH
REM Another reason is when using If, the commands are parsed at the time before entering the If: Problems if in the if, an environment variable is changed and used its new value still in the if: Because the parsing will keep its value at what it was before the if
REM    That's why 'set "PATH=%WinMergePath%;%PATH%"' is below instead of being inside the if above, which set WinMergePath if not already defined
@if not "%WinMergePath%"=="" set "PATH=%WinMergePath%;%PATH%"

REM Set WinDiffPath for Version Analyzer
@if "%WinDiffPath%"=="" (
 @if exist "C:\Program Files (x86)\WinDiff\WinDiff.Exe" (
  @set "WinDiffPath=C:\Program Files (x86)\WinDiff"
 )
)
@if not "%WinDiffPath%"==""  set "PATH=%WinDiffPath%;%PATH%"
@if not "%WYDE-ROOT%"=="" set "PATH=%WYDE-ROOT%\Bin;%WYDE-ROOT%\Dll;%WYDE-DLL%;%WYDE-ROOT%\EjbDll;%PATH%"
@if not "%ENV-ROOT%"=="" set "PATH=%ENV-ROOT%\Bin;%PATH%"

@if "%WYDE-BINARY%"=="" goto :error
@if "%WYDE-BINARY%"=="32" goto :32
@if "%WYDE-BINARY%"=="64" goto :64
:error
@echo Need to specify which versions 32b or 64b of additional dlls to be able to launch features relying on those dlls (LDAP, Interface, Test Cases) by adding
@echo @set WYDE-BINARY=32
@echo or 
@echo @set WYDE-BINARY=64
@echo in your eWAM set Env.bat
@pause
@goto end
:32
:64
@if not "%WF-ROOT%"=="" set "PATH=%WF-ROOT%\WFDll\%WYDE-BINARY%;%WF-ROOT%\bin;%PATH%"
:end
@if not "%WYDE-ROOT%"=="" SET "CLASSPATH=%WYDE-ROOT%\ProduceJava;%WYDE-ROOT%\ProduceJava\SystemEJB.jar;%WYDE-ROOT%\ProduceJava\Ejb.jar;%CLASSPATH%"

@Echo off


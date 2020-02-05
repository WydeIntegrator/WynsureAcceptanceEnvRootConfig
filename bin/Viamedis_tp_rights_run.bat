@ECHO OFF
@call "%~dp0eWAM Set Env.bat"

if "%CONFIG_TALEND%"=="" set "CONFIG_TALEND=%ENV-ROOT%\Talend\CONFIG_TALEND"
if "%ARCHIVEIN%"=="" set "ARCHIVEIN=%WF-ROOT%\Batch\IN_APPLI\ARCHIVEIN"
if "%HEALTHOUT%"=="" set "HEALTHOUT=%WF-ROOT%\Batch\OUT_APPLI\HEALTHOut"
%~d0
cd %~dp0
java -Xms256M -Xmx1024M -cp %WF_ROOT%;%WF-ROOT%/Talend/RunTime/Viamedis_tp_rights;%WF-ROOT%/Talend/RunTime/lib/routines.jar;%WF-ROOT%/Talend/RunTime/lib/commons-collections-3.2.1.jar;%WF-ROOT%/Talend/RunTime/lib/commons-collections-3.2.jar;%WF-ROOT%/Talend/RunTime/lib/commons-lang-2.6.jar;%WF-ROOT%/Talend/RunTime/lib/commons-logging-1.1.1.jar;%WF-ROOT%/Talend/RunTime/lib/log4j-1.2.15.jar;%WF-ROOT%/Talend/RunTime/lib/log4j-1.2.16.jar;%WF-ROOT%/Talend/RunTime/lib/dom4j-1.6.1.jar;%WF-ROOT%/Talend/RunTime/lib/jaxen-1.1.1.jar;%WF-ROOT%/Talend/RunTime/lib/activemq-all-5.10.0.jar;%WF-ROOT%/Talend/RunTime/lib/commons-beanutils-1.8.3.jar;%WF-ROOT%/Talend/RunTime/lib/staxon-1.2.jar;%WF-ROOT%/Talend/RunTime/lib/advancedPersistentLookupLib-1.0.jar;%WF-ROOT%/Talend/RunTime/lib/json-lib-2.4-jdk15.jar;%WF-ROOT%/Talend/RunTime/lib/jboss-serialization.jar;%WF-ROOT%/Talend/RunTime/lib/thashfile.jar;%WF-ROOT%/Talend/RunTime/lib/trove.jar;%WF-ROOT%/Talend/RunTime/lib/talend_file_enhanced_20070724.jar;%WF-ROOT%/Talend/RunTime/lib/xom-1.2.7.jar;%WF-ROOT%/Talend/RunTime/lib/ezmorph-1.0.6.jar;%WF-ROOT%/Talend/RunTime/Viamedis_tp_rights/viamedis_tp_rights_0_1.jar; local_project.viamedis_tp_rights_0_1.Viamedis_tp_rights  %* 

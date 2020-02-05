@ECHO OFF
@call "%~dp0eWAM Set Env.bat"

if "%CONFIG_TALEND%"=="" set "CONFIG_TALEND=%ENV-ROOT%\Talend\CONFIG_TALEND"
if "%ARCHIVEIN%"=="" set "ARCHIVEIN=%WF-ROOT%\Batch\IN_APPLI\ARCHIVEIN"

if "%NOEMIEIN%"=="" set "NOEMIEIN=%WF-ROOT%\Batch\IN_APPLI\NOEMIERetour"
if "%NOEMIEOUT%"=="" set "HEALTHOUT=%WF-ROOT%\Batch\OUT_APPLI\HEALTHOut"
%~d0
cd %~dp0


java -Xms256M -Xmx1024M -cp %WF-ROOT%;%WF-ROOT%/Talend/RunTime/integration_file_Noemie;%WF-ROOT%/Talend/RunTime/lib/routines.jar;%WF-ROOT%/Talend/RunTime/lib/activation.jar;%WF-ROOT%/Talend/RunTime/lib/advancedPersistentLookupLib-1.0.jar;%WF-ROOT%/Talend/RunTime/lib/checkArchive.jar;%WF-ROOT%/Talend/RunTime/lib/commons-codec-1.9.jar;%WF-ROOT%/Talend/RunTime/lib/commons-collections-3.2.2.jar;%WF-ROOT%/Talend/RunTime/lib/commons-compress-1.10.jar;%WF-ROOT%/Talend/RunTime/lib/dom4j-1.6.1.jar;%WF-ROOT%/Talend/RunTime/lib/jakarta-oro-2.0.8.jar;%WF-ROOT%/Talend/RunTime/lib/jax-qname.jar;%WF-ROOT%/Talend/RunTime/lib/jaxen-1.1.1.jar;%WF-ROOT%/Talend/RunTime/lib/jaxp-api.jar;%WF-ROOT%/Talend/RunTime/lib/jaxp-ri.jar;%WF-ROOT%/Talend/RunTime/lib/jboss-serialization.jar;%WF-ROOT%/Talend/RunTime/lib/jdom-1.1.jar;%WF-ROOT%/Talend/RunTime/lib/log4j-1.2.15.jar;%WF-ROOT%/Talend/RunTime/lib/log4j-1.2.16.jar;%WF-ROOT%/Talend/RunTime/lib/saaj-api-1.3.jar;%WF-ROOT%/Talend/RunTime/lib/saaj-impl-1.3.2.jar;%WF-ROOT%/Talend/RunTime/lib/talend-soap-2.0-20160927.jar;%WF-ROOT%/Talend/RunTime/lib/talend_file_enhanced_20070724.jar;%WF-ROOT%/Talend/RunTime/lib/talendzip.jar;%WF-ROOT%/Talend/RunTime/lib/thashfile-2.0-20170329.jar;%WF-ROOT%/Talend/RunTime/lib/trove.jar;%WF-ROOT%/Talend/RunTime/lib/xercesImpl.jar;%WF-ROOT%/Talend/RunTime/lib/zip4j_1.3.1.jar;%WF-ROOT%/Talend/RunTime/integration_file_Noemie/integration_file_noemie_0_1.jar;%WF-ROOT%/Talend/RunTime/integration_file_Noemie/move_file_0_1.jar; local_project.integration_file_noemie_0_1.integration_file_Noemie  %* 

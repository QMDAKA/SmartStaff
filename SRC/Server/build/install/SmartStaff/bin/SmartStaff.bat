@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  SmartStaff startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and SMART_STAFF_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\SmartStaff-1.0.jar;%APP_HOME%\lib\unboundid-ldapsdk-se.jar;%APP_HOME%\lib\httpclient-4.5.2.jar;%APP_HOME%\lib\httpcore-4.4.4.jar;%APP_HOME%\lib\jsoup-1.9.2.jar;%APP_HOME%\lib\spring-boot-starter-web-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-data-rest-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-data-jpa-1.3.2.RELEASE.jar;%APP_HOME%\lib\mysql-connector-java-5.1.38.jar;%APP_HOME%\lib\spring-boot-starter-thymeleaf-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-hateoas-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-devtools-1.3.2.RELEASE.jar;%APP_HOME%\lib\httpcore-4.4.1.jar;%APP_HOME%\lib\httpclient-4.5.jar;%APP_HOME%\lib\elasticsearch-1.6.0.jar;%APP_HOME%\lib\json-20140107.jar;%APP_HOME%\lib\spring-ldap-core-2.1.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-validation-1.3.2.RELEASE.jar;%APP_HOME%\lib\jackson-databind-2.6.5.jar;%APP_HOME%\lib\spring-web-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-4.2.4.RELEASE.jar;%APP_HOME%\lib\jackson-annotations-2.6.5.jar;%APP_HOME%\lib\spring-data-rest-webmvc-2.4.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-aop-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-jdbc-1.3.2.RELEASE.jar;%APP_HOME%\lib\hibernate-entitymanager-4.3.11.Final.jar;%APP_HOME%\lib\javax.transaction-api-1.2.jar;%APP_HOME%\lib\spring-data-jpa-1.9.2.RELEASE.jar;%APP_HOME%\lib\spring-aspects-4.2.4.RELEASE.jar;%APP_HOME%\lib\thymeleaf-spring4-2.1.4.RELEASE.jar;%APP_HOME%\lib\thymeleaf-layout-dialect-1.3.1.jar;%APP_HOME%\lib\spring-hateoas-0.19.0.RELEASE.jar;%APP_HOME%\lib\spring-plugin-core-1.2.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-1.3.2.RELEASE.jar;%APP_HOME%\lib\spring-boot-autoconfigure-1.3.2.RELEASE.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\lucene-core-4.10.4.jar;%APP_HOME%\lib\lucene-analyzers-common-4.10.4.jar;%APP_HOME%\lib\lucene-queries-4.10.4.jar;%APP_HOME%\lib\lucene-memory-4.10.4.jar;%APP_HOME%\lib\lucene-highlighter-4.10.4.jar;%APP_HOME%\lib\lucene-queryparser-4.10.4.jar;%APP_HOME%\lib\lucene-sandbox-4.10.4.jar;%APP_HOME%\lib\lucene-suggest-4.10.4.jar;%APP_HOME%\lib\lucene-misc-4.10.4.jar;%APP_HOME%\lib\lucene-join-4.10.4.jar;%APP_HOME%\lib\lucene-grouping-4.10.4.jar;%APP_HOME%\lib\lucene-spatial-4.10.4.jar;%APP_HOME%\lib\antlr-runtime-3.5.jar;%APP_HOME%\lib\asm-4.1.jar;%APP_HOME%\lib\asm-commons-4.1.jar;%APP_HOME%\lib\snakeyaml-1.16.jar;%APP_HOME%\lib\slf4j-api-1.7.13.jar;%APP_HOME%\lib\spring-beans-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-core-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-tx-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-logging-1.3.2.RELEASE.jar;%APP_HOME%\lib\tomcat-embed-core-8.0.30.jar;%APP_HOME%\lib\tomcat-embed-el-8.0.30.jar;%APP_HOME%\lib\tomcat-embed-logging-juli-8.0.30.jar;%APP_HOME%\lib\tomcat-embed-websocket-8.0.30.jar;%APP_HOME%\lib\hibernate-validator-5.2.2.Final.jar;%APP_HOME%\lib\jackson-core-2.6.5.jar;%APP_HOME%\lib\spring-aop-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-context-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-expression-4.2.4.RELEASE.jar;%APP_HOME%\lib\spring-data-rest-core-2.4.2.RELEASE.jar;%APP_HOME%\lib\json-patch-1.7.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.13.jar;%APP_HOME%\lib\aspectjweaver-1.8.8.jar;%APP_HOME%\lib\tomcat-jdbc-8.0.30.jar;%APP_HOME%\lib\spring-jdbc-4.2.4.RELEASE.jar;%APP_HOME%\lib\jboss-logging-3.3.0.Final.jar;%APP_HOME%\lib\jboss-logging-annotations-1.2.0.Beta1.jar;%APP_HOME%\lib\hibernate-core-4.3.11.Final.jar;%APP_HOME%\lib\dom4j-1.6.1.jar;%APP_HOME%\lib\hibernate-commons-annotations-4.0.5.Final.jar;%APP_HOME%\lib\hibernate-jpa-2.1-api-1.0.0.Final.jar;%APP_HOME%\lib\javassist-3.18.1-GA.jar;%APP_HOME%\lib\spring-data-commons-1.11.2.RELEASE.jar;%APP_HOME%\lib\spring-orm-4.2.4.RELEASE.jar;%APP_HOME%\lib\thymeleaf-2.1.4.RELEASE.jar;%APP_HOME%\lib\groovy-2.4.4.jar;%APP_HOME%\lib\spatial4j-0.4.1.jar;%APP_HOME%\lib\logback-classic-1.1.3.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.13.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.13.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar;%APP_HOME%\lib\classmate-1.1.0.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\evo-inflector-1.2.1.jar;%APP_HOME%\lib\jackson-coreutils-1.6.jar;%APP_HOME%\lib\jsr305-2.0.1.jar;%APP_HOME%\lib\tomcat-juli-8.0.30.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jandex-1.1.0.Final.jar;%APP_HOME%\lib\xml-apis-1.0.b2.jar;%APP_HOME%\lib\ognl-3.0.8.jar;%APP_HOME%\lib\unbescape-1.1.0.RELEASE.jar;%APP_HOME%\lib\logback-core-1.1.3.jar;%APP_HOME%\lib\msg-simple-1.1.jar;%APP_HOME%\lib\guava-16.0.1.jar;%APP_HOME%\lib\btf-1.2.jar

@rem Execute SmartStaff
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SMART_STAFF_OPTS%  -classpath "%CLASSPATH%" gmo.MainApplication %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable SMART_STAFF_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%SMART_STAFF_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

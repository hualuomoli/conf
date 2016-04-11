@echo OFF

set filename=environment.reg
rem user environment path
set PATH=

echo Windows Registry Editor Version 5.00 > %filename%

echo [HKEY_CURRENT_USER\Environment] >> %filename%


rem java
echo "JAVA_HOME"="D:\\Java\\jdk1.7.0_67" >> %filename%
PATH=%PATH%D:\\Java\\jdk1.7.0_67\\bin;

rem maven
echo "MVN_HOME"="D:\\apache-maven-3.3.3" >> %filename%
PATH=%PATH%D:\\apache-maven-3.3.3\\bin;

rem PATH
echo "PATH"="%PATH%" >> %filename%

call %filename%

echo user environment has been configure
pause
@echo off

:: commit message
set /p message=Please Input message:
echo.
if '%message%' == '' set message=add

:: password
set /p password=Please Input Password:
echo.
if '%password%' == '' set password=%git_password%

echo 'message is %message%'
echo 'passwor is %password%'

pause

:: git 
git add *
git commit -m %message%
git push --all --progress http://hualuomoli:%password%@github.com/hualuomoli/conf

pause
@echo off

cd conf

set last_version=1
git log > ../log.log & goto getCurr

:getCurr
for /f "tokens=2 delims= " %%i in (../log.log) do (
	set curr_version=%%i && goto getLast
)

:getLast
for /f "tokens=1 delims= " %%i in (../last.log) do (
	set last_version=%%i && goto end
)

:end
echo %curr_version%
echo %last_version%

if %curr_version% neq %last_version% goto update
echo there is no data to update & goto setCurr

:update
git pull
echo update newest files
goto setCurr

:setCurr
echo %curr_version% > ../last.log

cd ..

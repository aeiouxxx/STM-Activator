@echo off
reg query "HKEY_CURRENT_USER\SOFTWARE\Neuber GbR\Security Task Manager\Options" /v VPanel /t REG_SZ > nul
if %errorlevel%==0 ( goto activated ) else ( goto activation )
:activated
echo "Security Task Manager is already activated!"
goto end
:activation
reg add "HKEY_CURRENT_USER\SOFTWARE\Neuber GbR\Security Task Manager\Options" /v VPanel /t REG_SZ /d 1 /F > nul
reg query "HKEY_CURRENT_USER\SOFTWARE\Neuber GbR\Security Task Manager\Options" /v VPanel /t REG_SZ > nul
if %errorlevel%==0 ( echo "Security Task Manager has been activated successfully!" ) else ( echo "WARNING: Security Task Manager was not activated successfully!" )
:end
pause
exit

@echo off
dir %systemroot%\Temp >nul
if '%errorlevel%' NEQ '0' (
    echo Run me again as ADMIN
    echo Press ENTER to exit...
    read
    exit
)
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/racaljk/hosts/master/hosts', 'hosts')"
rem powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/racaljk/hosts/master/hosts -OutFile hosts"
copy hosts %systemroot%\System32\drivers\etc\hosts
echo If you see no errors, your hosts file should have been updated
echo Press ENTER to exit...
read

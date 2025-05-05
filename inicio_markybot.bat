@echo off
cd /d "C:\Users\marco.pedroza\OneDrive - INEGI\Desktop\MarkyBotNuevo"
echo Carpeta actual: %cd% > ruta_log.txt

REM Verificar si Ollama ya está en ejecución
tasklist /FI "IMAGENAME eq ollama.exe" | find /I "ollama.exe" > nul
if %errorlevel%==0 (
    echo Ollama ya está en ejecución. >> ruta_log.txt
) else (
    echo Iniciando Ollama... >> ruta_log.txt
    start "" "C:\Windows\System32\cmd.exe" /min /c "ollama serve"
    timeout /t 5 > nul
)

REM Iniciar ollama_api.py
echo Lanzando ollama_api.py... >> ruta_log.txt
start "" /min cmd /c "python ollama_api.py"
timeout /t 10 > nul

REM Iniciar discord_bot.py
echo Lanzando discord_bot.py... >> ruta_log.txt
start "" /min cmd /c "python discord_bot.py"

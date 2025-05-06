@echo off
start D:\conda\envs\zhihu2Mark\python.exe app.py
if not exist ".\logs\app.log" (
    echo 日志文件不存在，请检查路径
    pause
    exit /b
)
powershell -command "$lines = Get-Content '.\logs\app.log' -Encoding UTF8 | Select-Object -Last 4; $lines; $urlLine = $lines[-2]; if ($urlLine -match 'https?://[^\s]+') { start $matches[0] }"
pause
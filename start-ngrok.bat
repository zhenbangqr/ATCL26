@echo off
cd /d %~dp0
echo ========================================
echo ATCL26 - Starting with ngrok
echo ========================================
echo.
echo Current directory: %CD%
echo.
echo Checking PHP installation...
php --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PHP is not installed or not in PATH!
    echo Please install PHP and add it to your system PATH.
    pause
    exit /b 1
)
echo [OK] PHP found
echo.
echo Checking if index.php exists...
if not exist "index.php" (
    echo [ERROR] index.php NOT FOUND!
    echo Please make sure you're running this from the project root directory.
    pause
    exit /b 1
)
echo [OK] index.php found
echo.
echo Starting PHP server on localhost:8000...
echo Using document root: %CD%
echo Command: php -S localhost:8000 router.php
echo.
start "PHP Server" cmd /k "cd /d %~dp0 && echo [PHP Server] Running on http://localhost:8000 && echo [PHP Server] Press Ctrl+C to stop && php -S localhost:8000 router.php"
timeout /t 3 /nobreak >nul
echo.
echo Starting ngrok tunnel...
echo.
echo Your application will be available at the ngrok URL shown below.
echo Press Ctrl+C to stop ngrok (PHP server will continue running).
echo.
ngrok http 8000

@echo off

REM Install NVM
echo Installing NVM...

REM Check if the system is Windows or Mac
ver | findstr /i "windows" >nul
if %errorlevel%==0 (
    REM Windows
    echo Please download and run the NVM exe file attached to this message.
    pause
) else (
    REM Mac
    echo Please run the following command in your VS Code terminal:
    echo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    pause
)

REM Check NVM installation
nvm -v
if %errorlevel% neq 0 (
    echo NVM installation failed. Please try again.
    exit /b 1
)

REM Install Node.js version 20.17.0
nvm install 20.17.0
nvm use 20.17.0

REM Verify Node.js version
nvm ls

REM Download and move .env file
echo Please download the .env file from Discord and move it into the clearviewf24 folder.
pause


REM Enable pnpm
echo Enabling PNPM
corepack enable pnpm


REM Prepare pnpm
corepack prepare pnpm@latest --activate

REM Install dependencies
echo Installing Dependencies...
pnpm add bcryptjs body-parser connect-flash connect-pg-simple cookie-parser dotenv ejs express express-ejs-layouts express-messages express-session express-validator jsonwebtoken nodemon pg


REM Run the development server
pnpm run dev
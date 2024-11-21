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
echo Renaming the file to .env...
rename "clearviewf24\*.env" ".env"

REM Enable pnpm
corepack enable pnpm
if %errorlevel% neq 0 (
    npm install -g pnpm
)

REM Prepare pnpm
corepack prepare pnpm@latest --activate

REM Install dependencies
pnpm add bcryptjs body-parser connect-flash connect-pg-simple cookie-parser dotenv ejs express express-ejs-layouts express-messages express-session express-validator jsonwebtoken nodemon pg
if %errorlevel% neq 0 (
    echo Failed to install dependencies. Please try again.
    exit /b 1
)

REM Run the development server
pnpm run dev
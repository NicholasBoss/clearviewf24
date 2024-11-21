#!/bin/bash

# Check if the script is running on Mac or Windows
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac installation
    echo "Installing NVM on Mac..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
else
    # Windows installation
    echo "Please download and run the NVM exe file from the provided link."
    exit 1
fi

# Reload shell configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Verify NVM installation
nvm -v

# Install and use Node.js version 20.17.0
nvm install 20.17.0
nvm use 20.17.0

# Verify the installed Node.js version
nvm ls

# Move the .env file to the clearviewf24 folder
echo "Please download the .env file from Discord and move it to the clearviewf24 folder. Rename it back to .env if necessary."

# Enable pnpm or install it globally
corepack enable pnpm || npm install -g pnpm

# Prepare pnpm
corepack prepare pnpm@latest --activate

# Install required packages
pnpm add bcryptjs body-parser connect-flash connect-pg-simple cookie-parser dotenv ejs express express-ejs-layouts express-messages express-session express-validator jsonwebtoken nodemon pg

# Run the development server
pnpm run dev
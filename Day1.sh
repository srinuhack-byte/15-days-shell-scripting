#!/bin/bash
##########################################
# Script to create a project folder structure
# Usage: ./create_project.sh [project_name]
# Default project_name = "project"
##########################################

set -e  # Exit immediately if a command fails
#set -x # Debug mode (uncomment if needed)

# Project name from argument, fallback = "project"
PROJECT_NAME=${1:-project}

echo "🚀 Creating project structure for: $PROJECT_NAME"

# Check if project folder already exists
if [ -d "$PROJECT_NAME" ]; then
    echo "⚠️  Project '$PROJECT_NAME' already exists. Exiting."
    exit 1
fi

# Create base folders
mkdir -p "$PROJECT_NAME"/{src,logs,bin,config}

# Create files if they don't exist
touch "$PROJECT_NAME"/src/{main.sh,utils.sh}
touch "$PROJECT_NAME"/logs/app.log
touch "$PROJECT_NAME"/bin/run.sh
touch "$PROJECT_NAME"/config/app-config.yaml

# Make scripts executable
chmod +x "$PROJECT_NAME"/src/main.sh "$PROJECT_NAME"/bin/run.sh

echo "✅ Project structure for '$PROJECT_NAME' created successfully!"

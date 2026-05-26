#!/bin/bash

REPO_URL="https://github.com/Sahil-M-Deo/Randomised-Algorithms.git"

if [ ! -d ".git" ]; then
    echo "No git repo found. Initializing..."
    git init
    git branch -M main
fi

if ! git remote get-url origin >/dev/null 2>&1; then
    echo "Adding remote origin..."
    git remote add origin "$REPO_URL"
fi

current_name=$(git config user.name)
current_email=$(git config user.email)

if [ -z "$current_name" ]; then
    read -p "Enter git user.name: " username
    git config user.name "$username"
else
    echo "Using saved user.name: $current_name"
fi

if [ -z "$current_email" ]; then
    read -p "Enter git user.email: " email
    git config user.email "$email"
else
    echo "Using saved user.email: $current_email"
fi

git add .

if git diff --cached --quiet; then
    echo "Nothing to commit."
    exit 0
fi

read -p "Commit message: " msg

git commit -m "$msg"

git push -u origin main

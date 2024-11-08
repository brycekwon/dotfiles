#!/usr/bin/env bash


USER_JS_URL="https://raw.githubusercontent.com/arkenfox/user.js/refs/heads/master/user.js"
OVERRIDES_FILE="./settings/firefox/user-overrides.js"
TARGET_DIR="./_builds/firefox"
TARGET_FILE="$TARGET_DIR/user.js"

if ! command -v wget &> /dev/null; then
    echo "Error: wget is not installed. Please install wget and try again."
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory '$TARGET_DIR' does not exist. Creating..."
    mkdir -p "$TARGET_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory '$TARGET_DIR'."
        exit 1
    fi
fi

echo "Fetching the latest user.js file..."
wget -q -O /tmp/latest-user.js "$USER_JS_URL"

if [ $? -ne 0 ]; then
    echo "Error: Failed to download user.js file."
    exit 1
fi

if [ -f "$OVERRIDES_FILE" ]; then
    echo "Appending overrides..."
    cat "$OVERRIDES_FILE" >> /tmp/latest-user.js
else
    echo "No overrides file found. Skipping appending."
fi

echo "Replacing the user.js file..."
mv /tmp/latest-user.js "$TARGET_FILE"

echo "user.js file updated successfully."

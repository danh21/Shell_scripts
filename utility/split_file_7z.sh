#!/bin/bash

# Path to 7z (Windows)
SEVENZIP="C:\Program Files\7-Zip\7z.exe"

# Limit size: 50MB
LIMIT=52428800

# Volume size (45MB)
VOLUME_SIZE="45m"

echo "🔍 Checking staged files for size > 50MB..."

git diff --cached --name-only --diff-filter=AM | while read -r file; do
    if [ -f "$file" ]; then
        size=$(stat -c%s "$file")

        if [ "$size" -gt "$LIMIT" ]; then
            echo "🚨 File too large: '$file' → $(($size / 1024 / 1024))MB"
            echo "⏪ Removing '$file' from staging..."
            git restore --staged "$file"

            BASENAME=$(basename "$file")
            NAME="${BASENAME%.*}"
            FILE_DIR=$(dirname "$file")

            ARCHIVE_NAME="${FILE_DIR}/${NAME}.7z"

            echo "📦 Compressing with 7z..."

            "$SEVENZIP" a -t7z -mx=9 -v$VOLUME_SIZE "$ARCHIVE_NAME" "$file"

            echo "➕ Adding split files to git..."
            git add "${ARCHIVE_NAME}".*

            echo "🧹 Removing original file..."
            rm -f "$file"
        fi
    fi
done
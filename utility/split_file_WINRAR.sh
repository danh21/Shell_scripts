#!/bin/bash

# Path to WinRAR (based on your computer)
WINRAR="C:\Program Files\WinRAR\WinRAR.exe"

# Limit size: 50MB = 50 * 1024 * 1024 = 52428800 bytes
LIMIT=52428800

# Set size for compressed files
VOLUME_SIZE="45m"

# Check staged files and split file
echo "🔍 Checking staged files for size > 50MB..."
git diff --cached --name-only --diff-filter=AM | while read -r file; do
    if [ -f "$file" ]; then
        size=$(stat -c%s "$file")
        if [ "$size" -gt "$LIMIT" ]; then
            echo "🚨 File too large: '$file' → $(($size / 1024 / 1024))MB"
            echo "⏪ Removing '$file' from staging..."
            git restore --staged "$file"

						# Name file output
						BASENAME=$(basename "$file" | cut -d. -f1)

            # Get folder containing origin file
            FILE_DIR=$(dirname "$file")

            # Create archive
            ARCHIVE_NAME="${FILE_DIR}/${BASENAME%.*}.rar"

						# Run WinRAR to extract
						"$WINRAR" a -m5 -v$VOLUME_SIZE -ep1 "$ARCHIVE_NAME" "$file"
			
						# remove origin file
            rm -f "$file"
        fi
    fi
done
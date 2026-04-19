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

            FILE_DIR=$(dirname "$file")
            BASENAME=$(basename "$file")
            NAMEONLY="${BASENAME%.*}"
            ARCHIVE_NAME="${FILE_DIR}/${NAMEONLY}.rar"

            # Snapshot .rar files BEFORE compression
            before=$(find "$FILE_DIR" -maxdepth 1 -type f -name "*.rar" | sort)

            # Run WinRAR
            "$WINRAR" a -m5 -v$VOLUME_SIZE -ep1 "$ARCHIVE_NAME" "$file"

            # Snapshot .rar files AFTER compression
            after=$(find "$FILE_DIR" -maxdepth 1 -type f -name "*.rar" | sort)

            echo "➕ Adding split files to git..."

            # Add ONLY newly created .rar files (diff before vs after)
            comm -13 <(echo "$before") <(echo "$after") | while read -r rar_file; do
                git add "$rar_file"
                echo "  ✅ Added: $rar_file"
            done

            rm -f "$file"
        fi
    fi
done
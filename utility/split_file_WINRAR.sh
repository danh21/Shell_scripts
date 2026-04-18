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
            NAMEONLY="${BASENAME%.*}"   # strip extension

            # Archive output path
            ARCHIVE_NAME="${FILE_DIR}/${NAMEONLY}.rar"

            # Run WinRAR to split
            "$WINRAR" a -m5 -v$VOLUME_SIZE -ep1 "$ARCHIVE_NAME" "$file"

            echo "➕ Adding split files to git..."
            # Case 1: split → filename.part1.rar, filename.part2.rar ...
            # Case 2: single → filename.rar
            # Add all .rar files matching the basename
            find "$FILE_DIR" -maxdepth 1 \( \
                -name "${NAMEONLY}.part*.rar" \
                -o -name "${NAMEONLY}.rar" \
            \) | while read -r rar_file; do
                git add "$rar_file"
                echo "  ✅ Added: $rar_file"
            done

            rm -f "$file"
        fi
    fi
done
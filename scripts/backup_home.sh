#!/bin/bash

# Путь к директории назначения
DEST_DIR="/tmp/backup"

# Исходная директория
SOURCE_DIR="/home/skvortsov/"

# Лог-файл для rsync
LOG_FILE="/var/log/rsync_backup.log"

# Имя скрипта для логирования в syslog
SCRIPT_NAME="home_backup_script"

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    if [ $? -ne 0 ]; then
        logger -t "$SCRIPT_NAME" "ERROR: Failed to create destination directory $DEST_DIR."
        echo "ERROR: Failed to create destination directory $DEST_DIR. See syslog for details." >> "$LOG_FILE"
        exit 1
    fi
fi

rsync -avhc --delete --exclude '.*' "$SOURCE_DIR" "$DEST_DIR" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    logger -t "$SCRIPT_NAME" "INFO: Home directory backup completed successfully to $DEST_DIR."
    echo "$(date): Backup completed successfully." >> "$LOG_FILE"
else
    logger -t "$SCRIPT_NAME" "ERROR: Home directory backup failed to $DEST_DIR. Check $LOG_FILE for details."
    echo "$(date): Backup failed. See syslog and $LOG_FILE for errors." >> "$LOG_FILE"
fi

exit 0

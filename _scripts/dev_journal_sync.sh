#!/bin/bash
# dev_journal_sync.sh
# Script to sync development journals to Google Drive

# Configuration
LOCAL_JOURNAL_DIR="_dev_journals"
GDRIVE_FOLDER="Brandmine/DevJournals"
DATE=$(date +"%Y-%m-%d")
LOG_FILE="journal_sync_log.txt"

echo "===== Dev Journal Sync: $DATE =====" | tee -a "$LOG_FILE"

# Check if rclone is installed
if ! command -v rclone &> /dev/null; then
    echo "Error: rclone is not installed. Please install it first:" | tee -a "$LOG_FILE"
    echo "Visit https://rclone.org/install/ for installation instructions" | tee -a "$LOG_FILE"
    exit 1
fi

# Check if rclone is configured with Google Drive
if ! rclone listremotes | grep -q "gdrive:"; then
    echo "Error: Google Drive remote not configured in rclone" | tee -a "$LOG_FILE"
    echo "Please run 'rclone config' to set up Google Drive access" | tee -a "$LOG_FILE"
    exit 1
fi

# Ensure local directory exists
if [ ! -d "$LOCAL_JOURNAL_DIR" ]; then
    echo "Creating local journal directory: $LOCAL_JOURNAL_DIR" | tee -a "$LOG_FILE"
    mkdir -p "$LOCAL_JOURNAL_DIR"
fi

# Sync journals to Google Drive
echo "Syncing dev journals to Google Drive folder: $GDRIVE_FOLDER" | tee -a "$LOG_FILE"
rclone sync "$LOCAL_JOURNAL_DIR" "gdrive:$GDRIVE_FOLDER" --progress 2>&1 | tee -a "$LOG_FILE"

echo "Sync completed at $(date +"%H:%M:%S")" | tee -a "$LOG_FILE"
echo "----------------------------------" | tee -a "$LOG_FILE"
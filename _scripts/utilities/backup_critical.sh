#!/bin/bash
# backup_critical.sh - Backup key files before major changes

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="_backups/$TIMESTAMP"

mkdir -p $BACKUP_DIR
mkdir -p $BACKUP_DIR/assets/css
mkdir -p $BACKUP_DIR/_includes
mkdir -p $BACKUP_DIR/_layouts

# Backup key files
cp -r assets/css $BACKUP_DIR/assets/
cp -r _includes $BACKUP_DIR/
cp -r _layouts $BACKUP_DIR/
cp _config.yml $BACKUP_DIR/

echo "Backup created at $BACKUP_DIR"

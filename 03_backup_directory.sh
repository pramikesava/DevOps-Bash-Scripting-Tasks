SOURCE_DIR="$HOME/backup_source"
BACKUP_DIR="$HOME/backups"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz" -C "$HOME" backup_source

echo "Directory backup completed successfully"

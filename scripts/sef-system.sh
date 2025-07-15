#!/bin/bash
# 🛡️ Smart EFIS Distribution Engine

ACTION=$1
TARGET=$2
MSG=$3

LOG_DIR=~/smart-efis-global/.logs
ARCHIVE_DIR=~/smart-efis-global/.archive
mkdir -p "$LOG_DIR" "$ARCHIVE_DIR"

case "$ACTION" in
  add)
    cp "$TARGET" ~/smart-efis-global/
    echo "$(date) - Added: $TARGET | $MSG" >> "$LOG_DIR/system.log"
    ;;
  rechange)
    cp "$TARGET" "$ARCHIVE_DIR/$(basename $TARGET).bak.$(date +%s)"
    cp "$TARGET" ~/smart-efis-global/
    echo "$(date) - Replaced: $TARGET | $MSG" >> "$LOG_DIR/system.log"
    ;;
  delete)
    mv "$TARGET" "$ARCHIVE_DIR/$(basename $TARGET).deleted.$(date +%s)"
    echo "$(date) - Deleted: $TARGET | $MSG" >> "$LOG_DIR/system.log"
    ;;
  *)
    echo "❌ Unknown action. Use: add | rechange | delete"
    ;;
esac

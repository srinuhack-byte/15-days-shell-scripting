#!/bin/bash
############################################
# Script: log_monitor.sh
# Purpose: Monitor logs for "ERROR"
############################################

LOG_FILE="/var/log/syslog"

if [[ -f "$LOG_FILE" ]]; then
  echo "Monitoring $LOG_FILE for 'ERROR'..."
  tail -F "$LOG_FILE" | while read line
  do
    if echo "$line" | grep -q "ERROR"; then
      echo "🚨 ALERT: $line"
    fi
  done
else
  echo "$LOG_FILE not found, using journalctl instead..."
  journalctl -f -o cat | while read line
  do
    if echo "$line" | grep -q "ERROR"; then
      echo "🚨 ALERT: $line"
    fi
  done
fi

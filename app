#!/bin/bash
# ============================================================
# forensic_monitor_lite.sh
# FORENSIC MONITOR — Lite Edition
# Copyright (c) 2026 Thomas D. Kraemer / Kraemer Inc.
# All Rights Reserved.
# ============================================================
# Captures Apple rapportd daemon output in real time.
# Documents unauthorized SameAccountDevice authentications
# against your Apple ID — DirectLink, AWDL, DeviceAuthTag,
# and AcLv service tier events.
#
# Output: ~/Documents/forensic_monitor/LIVE_STREAM.log
#
# Usage: bash forensic_monitor_lite.sh
# Stop:  Ctrl+C
# ============================================================

LOG_DIR="$HOME/Documents/forensic_monitor"
LIVE_LOG="$LOG_DIR/LIVE_STREAM.log"

mkdir -p "$LOG_DIR"

echo "$(date) — Forensic Monitor Lite started" >> "$LIVE_LOG"
echo "$(date) — Output: $LIVE_LOG"
echo "Monitoring... Press Ctrl+C to stop"

log stream \
    --predicate '(process == "rapportd" OR process == "sharingd") AND
        (eventMessage CONTAINS "SameAccountDevice" OR
         eventMessage CONTAINS "DeviceAuthTag" OR
         eventMessage CONTAINS "DirectLink" OR
         eventMessage CONTAINS "AcLv" OR
         eventMessage CONTAINS "FILE SHARING" OR
         eventMessage CONTAINS "RPRemoteDisplayDaemon")' \
    --info \
    --style syslog | while IFS= read -r LINE; do
        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
        echo "$TIMESTAMP | $LINE" >> "$LIVE_LOG"
        echo "$TIMESTAMP | $LINE"
    done

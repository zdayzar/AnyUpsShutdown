#!/bin/bash

# Konfigurasi
ROUTER_IP="192.168.0.1"
TIMEOUT=5
LIMITGAGAL=30
SLEEP_INTERVAL=10
LOG_FILE="/var/log/check_connection.log"

# Inisialisasi
GAGAL=0

# Fungsi untuk menulis log
log() {
    echo "$(date) - $1" >> "$LOG_FILE" 2>/dev/null || echo "Failed to write to log: $1"
}

# Periksa apakah log file bisa ditulis
if ! touch "$LOG_FILE" 2>/dev/null; then
    echo "Error: Cannot write to $LOG_FILE. Check permissions."
    exit 1
fi

# Loop pengecekan koneksi
while true; do
    if ping -c 1 -W "$TIMEOUT" "$ROUTER_IP" > /dev/null; then
        if [ "$GAGAL" -gt 0 ]; then
            log "Connection to $ROUTER_IP restored. Resetting counter."
            GAGAL=0
        fi
    else
        GAGAL=$((GAGAL + 1))
        log "Ping to $ROUTER_IP failed. Count: $GAGAL"
        if [ "$GAGAL" -ge "$LIMITGAGAL" ]; then
            log "Maximum failed pings reached. Shutting down..."
            sudo shutdown -h now
            exit 0
        fi
    fi
    sleep "$SLEEP_INTERVAL"
done

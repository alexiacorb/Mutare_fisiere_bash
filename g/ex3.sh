#!/bin/bash
# Folosim job control
set -m

# Parsează opțiunile folosind getopts
while getopts ":u:i:" opt; do
    case "$opt" in
        u) USER="$OPTARG";;
        i) INTERVAL="$OPTARG";;
        *) echo "Opțiune necunoscută: -$OPTARG" >&2; exit 1;;
        :) echo "Opțiunea -$OPTARG necesita un argument." >&2; exit 1;;
    esac
done

shift $((OPTIND-1))

# Verifică dacă opțiunile obligatorii sunt setate
if [ -z "$USER" ] || [ -z "$INTERVAL" ]; then
    echo "ambele opt -u și -i sunt necesare." >&2
    exit 1
fi

LOG_FILE="/tmp/disk_usage.log"
ARCHIVE_FILE="/tmp/disk_usage_backup.tar.gz"
JOB_PID=""

# Blochează SIGTERM și SIGINT
trap '' SIGTERM SIGINT

handler_sigusr1() {
    # Pornește monitorizarea în background
    [ -f "$LOG_FILE" ] && rm -f "$LOG_FILE"
    touch "$LOG_FILE"
    
    (
        while true; do
            du -sh /home/"$USER" 2>/dev/null
            sleep "$INTERVAL"
        done
    ) >> "$LOG_FILE" 2>&1 &
    JOB_PID=$!
}

handler_sigusr2() {
    # Aduce job-ul în foreground
    # Nu putem da efectiv fg la un job în script non-interactiv, așa că:
    # Oprim jobul în background și rulăm bucla interactiv în foreground
    if [ -n "$JOB_PID" ] && kill -0 "$JOB_PID" 2>/dev/null; then
        kill "$JOB_PID"
        wait "$JOB_PID" 2>/dev/null
        JOB_PID=""
    fi

    while true; do
        du -sh /home/"$USER" 2>/dev/null
        sleep "$INTERVAL"
    done
}

handler_sigtstp() {
    # Oprește monitorizarea, arhivează log-ul și îl șterge
    if [ -n "$JOB_PID" ] && kill -0 "$JOB_PID" 2>/dev/null; then
        kill "$JOB_PID"
        wait "$JOB_PID" 2>/dev/null
    fi

    if [ -f "$LOG_FILE" ]; then
        tar -czf "$ARCHIVE_FILE" "$LOG_FILE"
        rm -f "$LOG_FILE"
    fi
    exit 0
}

trap handler_sigusr1 SIGUSR1
trap handler_sigusr2 SIGUSR2
trap handler_sigtstp SIGTSTP

# Așteaptă semnale
while true; do
    sleep 1
done

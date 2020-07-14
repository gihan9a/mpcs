#!/bin/zsh
# This cron backup the database
# Should be running every day at 12:00:00 hours
# 0 12 * * * cron.sh > /var/log/syslog

# variables
USER=root
PASS=bnfVvQK4yOw2
DATABASES=samupakara
DIR=$(pwd)
BACKUP_BASE_DIR="$DIR/backup"

# get file path for the database backup file
function get_backup_file_path {
    local year=$(date +%Y)
    local month=$(date +%m)
    local timestamp=$(date +%s)
    local retval="$BACKUP_BASE_DIR/$year/$month"

    # create directory
    mkdir -p $retval
    retval="$retval/$timestamp.bin"
    echo $retval
}
BACKUP_FILE_PATH=$(get_backup_file_path)

# execute
docker exec -i system_mysql_1 mysqldump -u"$USER" -p"$PASS" --databases "$DATABASES" > "$BACKUP_FILE_PATH"

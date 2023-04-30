#!/bin/bash
s3_bucket="techtvm-s3"
# Set the MySQL database information
db_host="techtvm-db01.csz2p6s00uwa.us-east-2.rds.amazonaws.com"
db_name="techtvm_db"
db_user="dbadmin"
db_password="dbPass123"
# Set the date format for the backup file names
backup_date=$(date +%Y-%m-%d_%H-%M-%S)
# Set the directory to store the backup files
backup_dir="/home/ubuntu/wp_backup"
# Create the backup directory if it doesn't exist
if [ -e "$backup_dir" ]
  then
    echo "backup folder exist!"
  else
    mkdir -p "$backup_dir"
fi
# Scheduled Backup the WordPress files to S3
cd $backup_dir
tar -cvzf "${backup_date}.tar.gz" /var/www/localhost/wordpress/
aws s3 cp "${backup_date}.tar.gz" "s3://${s3_bucket}/wordpress-backups/"

# Backup the MySQL database to a file
mysqldump -h "${db_host}" -u "${db_user}" -p"${db_password}" "${db_name}" > "${backup_dir}/db-backup-${backup_date}.sql"

# Upload the MySQL backup to S3
aws s3 cp "${backup_dir}/db-backup-${backup_date}.sql" "s3://${s3_bucket}/db-backups/${backup_date}/"

# Remove the local backup files to save disk space
#rm -rf "${backup_dir}/db-backup-${backup_date}.sql"

echo "Backup completed on ${backup_date}"

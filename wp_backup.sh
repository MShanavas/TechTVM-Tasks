#!/bin/bash

# Set the AWS region and S3 bucket name
aws_region="us-east-2"
s3_bucket="techtvm-s3"

# Set the MySQL database information
db_host="localhost"
db_name="techtvm_db"
db_user="root"
db_password="dbPass123"

# Set the date format for the backup file names
backup_date=$(date +%Y-%m-%d_%H-%M-%S)

# Set the directory to store the backup files
backup_dir="/home/wp_backup"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"
#Install AWS CLI
apt install awscli -y

# Backup the WordPress files to S3
aws s3 cp --recursive /var/www/html/wordpress "s3://${s3_bucket}/wordpress-backups/${backup_date}/"

# Backup the MySQL database to a file
mysqldump -h "${db_host}" -u "${db_user}" -p"${db_password}" "${db_name}" > "${backup_dir}/db-backup-${backup_date}.sql"

# Upload the MySQL backup to S3
aws s3 cp "${backup_dir}/db-backup-${backup_date}.sql" "s3://${s3_bucket}/db-backups/${backup_date}/"

# Remove the local backup files to save disk space
rm -rf "${backup_dir}/db-backup-${backup_date}.sql"

echo "Backup completed on ${backup_date}"

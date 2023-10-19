#!/bin/bash

# Define your Azure Blob Storage container and storage account information
container_name="your_container_name"
storage_account_name="your_storage_account_name"
storage_account_key="your_storage_account_key"

current_date=$(date +"%d-%m-%Y")
src="src$current_date"
dest="dest$current_date"
backup_dir="master_backup_2023"

mkdir -p "$backup_dir/$src"
touch "$backup_dir/$src/files_and_dirs.txt"
# Create a file with a list of files and directories sorted by modification time
ls -t > "$backup_dir/$src/files_and_dirs.txt"

# Create a destination directory
mkdir -p "$backup_dir/$dest"
mkdir -p "$backup_dir/$dest/dirs_backup"
mkdir -p "$backup_dir/$dest/files_backup"

# Read the list of files and directories from files_and_dirs.txt and copy them to the destination directory
while IFS= read -r entry
do
  if [ -d "$entry" ]; then
    # Copy directories and maintain the directory structure
    rsync -av --exclude="files_and_dirs.txt" "$entry/" "$backup_dir/$dest/dirs_backup/"
  else
    # Copy files to the files_backup directory
    cp "$entry" "$backup_dir/$dest/files_backup/"
  fi
done < "$backup_dir/$src/files_and_dirs.txt"

# Use Azure CLI to upload the files to the Azure Blob Storage container
az storage blob upload-batch --destination $container_name --source "$backup_dir/$dest" --type block --account-name $storage_account_name --account-key $storage_account_key

# Clean up the local backup
rm -r "$backup_dir/$src"
rm -r "$backup_dir/$dest"

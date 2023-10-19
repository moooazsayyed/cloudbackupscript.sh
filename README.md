## Overview

BashFriday Cloud Backup is a Bash script that automates daily backups of Linux directories and files. These backups are sorted by modification time, organized by date, and can be easily sent to Azure Blob Storage.

## Features

- Automatically backup Linux directories and files.
- Backup files are organized by date for easy management.
- Send backups to Azure Blob Storage for added data redundancy.

## Prerequisites

Before running this script, make sure you have the following:

- A Linux environment.
- `rsync` installed for efficient file synchronization.
- An Azure account with access to Azure Blob Storage.

## Usage

1. Clone this repository to your Linux machine:

 
git clone https://github.com/mooazsayyed/cloudbackupscript.sh.git
Edit the cloud_backup.sh script to include your Azure Blob Storage details.

Run the script to start the backup process:


./cloud_backup.sh
Configuration
You need to configure your Azure Blob Storage details in the cloud_backup.sh script. Replace the following placeholders with your Azure details:

<YourStorageAccount>
<YourStorageContainer>
<YourStorageSASKey>

  
## Contributing
Feel free to contribute to this project by opening issues, submitting pull requests, or providing suggestions for improvements. Your contributions are highly appreciated!


## Acknowledgments
Thanks to the BashFriday community for the inspiration and support.


This README provides an overview of your project, instructions for usage, and guidance on contributing and licensing. Make sure to customize it with your specific project details and requirements.

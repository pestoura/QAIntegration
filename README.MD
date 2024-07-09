# PowerShell Folder Synchronization Script

This PowerShell script automates the synchronization of folders from a source to a replica location, ensuring an exact and complete copy of the source folder's contents in the replica folder. It supports logging of file operations for transparency and troubleshooting.

## Features

- **One-Way Synchronization:** Copies all files and folders from the source folder to the replica folder.
- **Detailed Logging:** Logs creation, copying, and removal operations to both console output and a specified log file.
- **Parameterized Execution:** Accepts command-line arguments for source folder path, replica folder path, and log file path.
- **Native PowerShell Usage:** Does not depend on external tools like robocopy, leveraging PowerShell's native capabilities.

## Usage

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/pestoura/QAIntegration.git
   cd QAIntegration

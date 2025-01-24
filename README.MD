# QA Integration 

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

2. **Run the Script:**

- Open PowerShell and navigate to the script directory.
   ```bash
   cd QAIntegration

- Execute the script with appropriate parameters:
   ```bash
   .\Sync-Folders.ps1 -sourceFolder "C:\Path\To\Source" -replicaFolder "D:\Path\To\Replica" -logFilePath "C:\Path\To\Log\sync_log.txt"
Replace "C:\Path\To\Source", "D:\Path\To\Replica", and "C:\Path\To\Log\sync_log.txt" with your actual folder paths and log file path.
   
3. **Parameters:**

-sourceFolder: Path to the source folder that will be synchronized.  
-replicaFolder: Path to the replica folder where synchronization will be performed.  
-logFilePath: Path to the log file where all operations will be logged.

4. **Example:**

```bash
.\Sync-Folders.ps1 -sourceFolder "C:\Projects\SourceFolder" -replicaFolder "D:\Backup\ReplicaFolder" -logFilePath "C:\Logs\sync_log.txt"
```
5. **Error Handling:**

If the source folder doesn't exist or is inaccessible, an error will be displayed.
Ensure all paths provided are valid and accessible before running the script.

## Contributing

Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

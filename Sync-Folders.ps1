param (
    [string]$sourceFolder,
    [string]$replicaFolder,
    [string]$logFilePath
)

function Sync-Folders {
    param (
        [string]$source,
        [string]$destination,
        [string]$logFile
    )

    # Ensure destination folder exists
    if (-not (Test-Path -Path $destination -PathType Container)) {
        New-Item -ItemType Directory -Path $destination | Out-Null
    }

    # Synchronize files and folders
    Get-ChildItem -Path $source -Recurse | ForEach-Object {
        $targetPath = Join-Path -Path $destination -ChildPath $_.FullName.Substring($source.Length + 1)
        if ($_.PSIsContainer) {
            if (-not (Test-Path -Path $targetPath -PathType Container)) {
                New-Item -ItemType Directory -Path $targetPath | Out-Null
                Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Created folder: $targetPath" | Out-File -FilePath $logFile -Append
            }
        } else {
            Copy-Item -Path $_.FullName -Destination $targetPath -Force
            Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Copied file: $($_.FullName) to $targetPath" | Out-File -FilePath $logFile -Append
        }
    }

    # Clean up destination
    Get-ChildItem -Path $destination -Recurse | ForEach-Object {
        $sourceEquivalentPath = Join-Path -Path $source -ChildPath $_.FullName.Substring($destination.Length + 1)
        if (-not (Test-Path -Path $sourceEquivalentPath)) {
            if ($_.PSIsContainer) {
                Remove-Item -Path $_.FullName -Recurse -Force
                Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Removed folder: $($_.FullName)" | Out-File -FilePath $logFile -Append
            } else {
                Remove-Item -Path $_.FullName -Force
                Write-Output "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Removed file: $($_.FullName)" | Out-File -FilePath $logFile -Append
            }
        }
    }
}

# Validate source folder path
if (-not (Test-Path -Path $sourceFolder -PathType Container)) {
    Write-Error "Source folder does not exist or is invalid: $sourceFolder"
    exit 1
}

# Validate log file path
if (-not $logFilePath) {
    Write-Error "Log file path is required."
    exit 1
}

# Perform synchronization
Sync-Folders -source $sourceFolder -destination $replicaFolder -logFile $logFilePath

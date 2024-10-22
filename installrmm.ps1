# Define the download URL for the MSI file
$msiUrl = "https://prod.setup.itsupport247.net/windows/BareboneAgent/32/USINC-Uncommon_Solutions_Windows_OS_ITSPlatform_TKN0683b683-03af-488f-bae7-5fe1c1d69d3d/MSI/setup"

# Define the user's Downloads folder
$downloadsFolder = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('UserProfile'), 'Downloads')

# Define the MSI file name to be saved in the Downloads folder
$msiFileName = "USINC-Uncommon_Solutions_Windows_OS_ITSPlatform_TKN0683b683-03af-488f-bae7-5fe1c1d69d3d.msi"
$msiFilePath = [System.IO.Path]::Combine($downloadsFolder, $msiFileName)

# Download the MSI file to the user's Downloads folder
Write-Host "Downloading MSI file..."
Invoke-WebRequest -Uri $msiUrl -OutFile $msiFilePath

# Check if the MSI file exists in the Downloads folder
if (Test-Path -Path $msiFilePath) {
    Write-Host "MSI file downloaded successfully."
    
    # Start the MSI installer with admin privileges and in silent mode (/q)
    Write-Host "Starting the installation process..."
    Start-Process msiexec.exe -ArgumentList "/i `"$msiFilePath`" /q" -Verb RunAs
} else {
    Write-Host "MSI file not found in the Downloads folder. Download failed."
}

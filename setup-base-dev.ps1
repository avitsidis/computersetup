$principal = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if(-not $isAdmin)
{
    Write-Warning "Script must be executed as Administrator"
    Write-Warning "Cancel execution."
    exit;
}

Write-Host "Install chocolatey"
$env:chocolateyUseWindowsCompression = 'true'

[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#modules
Install-Module -Name posh-git

# tools
choco install procexp -y
choco install paint.net -y
choco install keepass.install -y
choco install 7zip.install -y
choco install adobereader -y
choco install notepadplusplus.install -y
choco install greenshot -y

#Dev
choco install python3 -y
choco install nodejs.install -y
choco install git.install -y
choco install vscode -y
choco install sourcetree -y
choco install visualstudio2017enterprise -y
#choco install visualstudio2015enterprise -y
choco install resharper-platform -y


#db
choco install sql-server-management-studio -y
choco install dbeaver -y

#web
choco install googlechrome -y
choco install firefox -y
choco install postman -y

#network
choco install wireshark -y
choco install filezilla -y
choco install putty -y
choco install fiddler -y
choco install rdcman -y

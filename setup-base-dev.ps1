
Write-Host "Install chocolatey"
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Install PS Get"
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

Write-Host "install posh-git"
install-module posh-git

choco install 7zip.install -y

choco install putty -y

write-host "configure Subsytem for linux"
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if (-not(Test-Path -Path $RegistryKeyPath)) {
  New-Item -Path $RegistryKeyPath -ItemType Directory -Force
}
#New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1
Set-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1

Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -All -LimitAccess -NoRestart

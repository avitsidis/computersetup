
Write-Host "Install chocolatey"
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Install PS Get"
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

Write-Host "install posh-git"
install-module posh-git

choco install 7zip.install -y

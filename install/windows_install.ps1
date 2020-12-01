Write-Host "***** Start Windows10 (>= Build 2004) Setup! *****" -ForegroundColor yellow

Write-Host "***** Enabling WSL2 *****" -ForegroundColor yellow
# Enable WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# Enable Virtual Machine Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Set Default Version of WSL to 2
wsl --set-default-version 2
Write-Host "***** WSL2 enabled *****" -ForegroundColor green

# Install Chocolatey Package Manager
Write-Host "***** Installing Windows Package Manager Chocholatey *****" -ForegroundColor yellow
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "***** Windows Package Manager Chocholatey installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Visual Studio Code *****" -ForegroundColor yellow
winget install Microsoft.VisualStudioCode
Write-Host "***** Visual Studio Code installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Terminal *****" -ForegroundColor yellow
winget install Microsoft.WindowsTerminal
Write-Host "***** Terminal installed successfully *****" -ForegroundColor green

Write-Host "***** Installing PowerToys *****" -ForegroundColor yellow
winget install Microsoft.PowerToys
Write-Host "***** PowerToys installed successfully *****" -ForegroundColor green

Write-Host "***** Installing 1Password 7 *****" -ForegroundColor yellow
winget install AgileBits.1Password7
Write-Host "***** 1Password 7 installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Adobe Acrobat Reader DC *****" -ForegroundColor yellow
winget install Adobe.AdobeAcrobatReaderDC
Write-Host "***** Adobe Acrobat Reader DC installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Figma *****" -ForegroundColor yellow
winget install Figma.Figma
Write-Host "***** Figma installed successfully *****" -ForegroundColor green

Write-Host "***** Installing WhatsApp *****" -ForegroundColor yellow
winget install WhatsApp.WhatsApp
Write-Host "***** WhatsApp installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Spotify *****" -ForegroundColor yellow
winget install Spotify.Spotify
Write-Host "***** Spotify installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Slack *****" -ForegroundColor yellow
winget install SlackTechnologies.Slack
Write-Host "***** Slack installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Mailspring *****" -ForegroundColor yellow
winget install Foundry376.Mailspring
Write-Host "***** Mailspring installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Typora *****" -ForegroundColor yellow
winget install Typora.Typora
Write-Host "***** Typora installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Firefox Developer Edition *****" -ForegroundColor yellow
winget install Mozilla.FirefoxDeveloperEdition
Write-Host "***** Firefox Developer Edition installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Google Chrome *****" -ForegroundColor yellow
winget install Google.Chrome
Write-Host "***** Google Chrome installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Docker Desktop *****" -ForegroundColor yellow
winget install Docker.DockerDesktop
Write-Host "***** Docker Desktop installed successfully *****" -ForegroundColor green

Write-Host "***** Installing NordVPN *****" -ForegroundColor yellow
winget install NordVPN.NordVPN
Write-Host "***** NordVPN installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Zoom *****" -ForegroundColor yellow
winget install Zoom.Zoom
Write-Host "***** Zoom installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Discord *****" -ForegroundColor yellow
winget install Discord.Discord
Write-Host "***** Discord installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Microsoft Teams *****" -ForegroundColor yellow
winget install Microsoft.Teams
Write-Host "***** Microsoft Teams installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Skype *****" -ForegroundColor yellow
winget install Microsoft.Skype
Write-Host "***** Skype installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Fonts (Fira Code, JetBrains Mono, Hack Nerd Font) *****" -ForegroundColor yellow
choco install jetbrainsmono
choco install firacode

# Install Hack Nerd Fonts
$Url = 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip'
New-Item -ItemType Directory -Path 'C:\ZipFolder\'
$ZipFile = 'C:\ZipFolder\' + $(Split-Path -Path $Url -Leaf) 
$Destination = 'C:\Extracted\'
New-Item -ItemType Directory -Path 'C:\Extracted\'
Invoke-WebRequest -Uri $Url -OutFile $ZipFile
Expand-Archive -LiteralPath $ZipFile -DestinationPath $Destination
Remove-Item -Recurse -Force 'C:\ZipFolder'
$FONTS = 0x14
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
$Fontdir = dir $Destination
foreach($File in $Fontdir) {
  if(!($file.name -match "pfb$")) {
    $try = $true
    $installedFonts = @(Get-ChildItem c:\windows\fonts | Where-Object {$_.PSIsContainer -eq $false} | Select-Object basename)
    $name = $File.baseName

    foreach($font in $installedFonts) {
      $font = $font -replace "_", ""
      $name = $name -replace "_", ""
      if($font -match $name) {
        $try = $false
      }
    }
    if($try) {
      $objFolder.CopyHere($File.fullname)
    }
  }
}
Remove-Item -Recurse -Force $Destination
Write-Host "***** Fonts (Fira Code, JetBrains Mono, Hack Nerd Font) installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Altair GraphQL Client *****" -ForegroundColor yellow
choco install altair-graphql
Write-Host "***** Altair GraphQL Client installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Ubuntu for WSL2 *****" -ForegroundColor yellow
winget install Canonical.Ubuntu
New-Item -ItemType Directory -Force $HOME\.icons
Invoke-WebRequest -Uri 'https://github.com/pantajoe/dotfiles/raw/main/windows/ubuntu.png' -OutFile $HOME\.icons\ubuntu.png
Write-Host "***** Ubuntu for WSL2 installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Steam *****" -ForegroundColor yellow
winget install Valve.Steam
Write-Host "***** Steam installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Ubisoft Connect *****" -ForegroundColor yellow
winget install Ubisoft.Connect
Write-Host "***** Ubisoft Connect installed successfully *****" -ForegroundColor green

Write-Host "***** Installing Epic Games Launcher *****" -ForegroundColor yellow
winget install EpicGames.EpicGamesLauncher
Write-Host "***** Epic Games Launcher installed successfully *****" -ForegroundColor green

Write-Host "***** Installing League of Legends *****" -ForegroundColor yellow
winget install RiotGames.LeagueOfLegends
Write-Host "***** League of Legends installed successfully *****" -ForegroundColor green

Write-Host "***** Windows10 (>= Build 2004) Setup completed! *****" -ForegroundColor green

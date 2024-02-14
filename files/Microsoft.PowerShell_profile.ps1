# PsProfile

# Using Oh My Posh
oh-my-posh init pwsh --config "C:\Users\tiago\projetos\windows\winsc\ohMyPoshThemes\amro.omp.json" | Invoke-Expression

# Aliases
Set-Alias -Name getip -Value ~\projetos\windows\winsc\getmypubip.ps1
Set-Alias -Name ifconfig -Value ~\projetos\windows\winsc\ifconfig.ps1
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name vim -Value nvim
Set-Alias -Name du -Value DiskUsage

# KeyMaps
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

$MaximumHistoryCount = 4096

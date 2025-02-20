# PsProfile

# Using Oh My Posh
oh-my-posh init pwsh --config "C:\Users\tiago\projetos\windows\winsc\ohMyPoshThemes\gruvbox.omp.json" | Invoke-Expression

# Aliases
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name vim -Value nvim
Set-Alias -Name du -Value DiskUsage
# Set-Alias -Name ubu -Value ubuntu2204.exe
# Set-Alias -Name touch -Value New-Item

# KeyMaps
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadLineKeyHandler -Chord "Tab" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "RightArrow" -Function ForwardWord
# ler aqui: https://stackoverflow.com/questions/74897569/how-to-change-the-suggestion-completion-key-on-powershell-7-3-0
Set-PSReadlineKeyHandler -Key Tab -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "Shift+Tab" -Function TabCompleteNext
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord "RightArrow" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord "LeftArrow" -Function BackwardWord

$MaximumHistoryCount = 4096

Function App-Upgrade {
  winget upgrade --all
}

Function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

Function getip {
  nslookup myip.opendns.com resolver1.opendns.com
}

Function Get-PubIP {
 (Invoke-WebRequest http://checkip.amazonaws.com).Content
}

Function ifconfig {
  Get-NetIpAddress | Select-Object InterfaceAlias,IPAddress,AddressFamily | Format-Table
}

Function Get-Zulu {
 Get-Date -Format u
}

Function Get-Pass {
-join(48..57+65..90+97..122|ForEach-Object{[char]$_}|Get-Random -C 20)
}

function uptime {
        Get-WmiObject win32_operatingsystem | select csname, @{LABEL='LastBootUpTime';
        EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
}

function reload-profile {
        & $profile
}

function find-file($name) {
        ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
                $place_path = $_.directory
                echo "${place_path}\${_}"
        }
}

function unzip ($file) {
        $dirname = (Get-Item $file).Basename
        echo("Extracting", $file, "to", $dirname)
        New-Item -Force -ItemType directory -Path $dirname
        expand-archive $file -OutputPath $dirname -ShowProgress
}

function grep($regex, $dir) {
        if ( $dir ) {
                ls $dir | select-string $regex
                return
        }
        $input | select-string $regex
}

function touch($file) {
        "" | Out-File $file -Encoding ASCII
}

function df {
        get-volume
}

function sed($file, $find, $replace){
        (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

function which($name) {
        Get-Command $name | Select-Object -ExpandProperty Definition
}

function export($name, $value) {
        set-item -force -path "env:$name" -value $value;
}

function pkill($name) {
        ps $name -ErrorAction SilentlyContinue | kill
}

function pgrep($name) {
        ps $name
}

function whereis($name) {
        (Get-Command $name).Source
}

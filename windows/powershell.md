[Home](../README.md) › Windows › PowerShell

# Windows PowerShell

## Discovering commands and help

| Command | Description |
| --- | --- |
| `Get-Command` | Essential tool for discovering what commands you can use |
| `Get-Command -CommandType "Function"` | Display only the available commands of type "Function" |
| `Get-Command -Name Remove*` | List commands that start with the verb Remove |
| `Get-Help` | Help for a cmdlet |
| `Get-Help New-LocalUser -Examples` | Example usage for the cmdlet New-LocalUser |
| `Get-Alias` | List aliases |
| `Get-Alias -Name "echo"` | Find the cmdlet behind its traditional counterpart `echo` |

## Files and navigation

| Command | Description |
| --- | --- |
| `Get-ChildItem` | Works like `dir` and `ls` |
| `Get-ChildItem -Path xxxxx` | List a specific path |
| `Set-Location -Path ".\Documents"` | Change the current directory to Documents |
| `New-Item -Path xxxxxxxx -ItemType "Directory"` (or `"File"`) | Create a directory or file |
| `Remove-Item -Path xxxxxx` | Delete an item |
| `Get-Content -Path ".\captain-hat.txt"` | Read a file |
| `Get-Item -Path "C:\House\house_log.txt" -Stream *` | List all data streams of a file (alternate data streams) |

## Sorting and filtering (pipeline)

| Command | Description |
| --- | --- |
| `Get-ChildItem \| Sort-Object Length` | List files in a directory sorted by size |
| `Get-ChildItem \| Where-Object -Property "Extension" -eq ".txt"` | Only `.txt` files |
| `Get-ChildItem \| Where-Object -Property "Name" -like "ship*"` | Names starting with "ship" |
| `Get-ChildItem \| Where-Object -Property Length -gt 100` | Items larger than 100 bytes |
| `Get-Service \| Where-Object {$_.DisplayName -like "*merry*"}` | Services whose display name contains "merry" |

## System, processes, network, hashes

| Command | Description |
| --- | --- |
| `Get-Service` | Status of services on the machine: running, stopped or paused |
| `Get-Process` | Detailed view of all running processes, including CPU and memory usage. Powerful for monitoring and troubleshooting |
| `Get-NetTCPConnection` | Current TCP connections, with both local and remote endpoints |
| `Get-FileHash` | Generate file hashes. Valuable in incident response, threat hunting and malware analysis to verify file integrity and detect tampering |

## Remote execution

| Command | Description |
| --- | --- |
| `Invoke-Command` | Run commands on local or remote computers |
| `Get-Help Invoke-Command -Examples` | Examples for `Invoke-Command` |
| `Invoke-Command -FilePath c:\scripts\test.ps1 -ComputerName Server01` | Combine the cmdlet with a custom script to automate tasks on remote computers |
| `Invoke-Command -ComputerName Server01 -Credential Domain01\User01 -ScriptBlock { Get-Culture }` | You don't need to know scripting to benefit: append `-ScriptBlock { ... }` |

## Related

- Previous: [Command Line (cmd)](./command-line.md) · [Windows Fundamentals](./fundamentals.md)
- Domain context: [Active Directory Basics](./active-directory-basics.md)
- Linux scripting: [Linux Shells](../linux/shells.md) · [cross-platform cheat sheet](../cross-platform.md)

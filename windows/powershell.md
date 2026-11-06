[Home](../README.md) › Windows › PowerShell

# Windows PowerShell

Open it: press **Win**, type `powershell`, press **Enter**.

**How PowerShell commands work:** every command is `Verb-Noun`, like `Get-Process` (get the processes) or `Remove-Item` (remove an item). If you know the action you want, guess the verb: `Get`, `New`, `Set`, `Remove`.

## 1. Find commands and get help

| Command | What it does | Example |
| --- | --- | --- |
| `Get-Command` | Lists all commands you can use | `Get-Command` |
| `Get-Command -Name Remove*` | Finds commands whose name starts with `Remove` (`*` means "anything") | `Get-Command -Name Remove*` |
| `Get-Command -CommandType "Function"` | Shows only commands of type Function | `Get-Command -CommandType "Function"` |
| `Get-Help` | Shows help for a command | `Get-Help Get-Process` |
| `Get-Help <cmd> -Examples` | Shows ready-made examples | `Get-Help New-LocalUser -Examples` |
| `Get-Alias` | Lists short names (aliases) for commands | `Get-Alias` |
| `Get-Alias -Name "echo"` | Shows which real command an alias points to | `Get-Alias -Name "echo"` → `Write-Output` |

## 2. Files and folders

| Command | What it does | Example |
| --- | --- | --- |
| `Get-ChildItem` | Lists files and folders (same as `dir` / `ls`) | `Get-ChildItem -Path "C:\Users"` |
| `Set-Location` | Moves into a folder (same as `cd`) | `Set-Location -Path ".\Documents"` |
| `New-Item` | Creates a folder or file | `New-Item -Path ".\notes" -ItemType "Directory"` |
| `New-Item` | Creates a file | `New-Item -Path ".\hello.txt" -ItemType "File"` |
| `Remove-Item` | Deletes a file or folder | `Remove-Item -Path ".\hello.txt"` |
| `Get-Content` | Shows what is inside a file | `Get-Content -Path ".\captain-hat.txt"` |
| `Get-Item -Stream *` | Shows hidden data streams attached to a file (attackers sometimes hide data here) | `Get-Item -Path "C:\House\house_log.txt" -Stream *` |

## 3. Sort and filter results

The `|` (pipe) sends the output of the left command into the right command.

| Command | What it does | Example |
| --- | --- | --- |
| `Sort-Object` | Sorts the results | `Get-ChildItem \| Sort-Object Length` (smallest file first) |
| `Where-Object -eq` | Keeps items that **equal** a value | `Get-ChildItem \| Where-Object -Property "Extension" -eq ".txt"` (only `.txt` files) |
| `Where-Object -like` | Keeps items that **match a pattern** | `Get-ChildItem \| Where-Object -Property "Name" -like "ship*"` (names starting with `ship`) |
| `Where-Object -gt` | Keeps items **greater than** a number | `Get-ChildItem \| Where-Object -Property Length -gt 100` (files bigger than 100 bytes) |

Other comparisons: `-lt` (less than), `-ne` (not equal), `-ge` (greater or equal).

## 4. System, network and security checks

| Command | What it does | Example |
| --- | --- | --- |
| `Get-Service` | Lists services and whether they are running or stopped | `Get-Service` |
| `Get-Service` + filter | Finds a service by part of its name | `Get-Service \| Where-Object {$_.DisplayName -like "*merry*"}` |
| `Get-Process` | Lists running programs with CPU and memory use | `Get-Process \| Sort-Object CPU -Descending` |
| `Get-NetTCPConnection` | Lists network connections (like `netstat`) | `Get-NetTCPConnection` |
| `Get-FileHash` | Creates a hash (fingerprint) of a file. If the hash changes, the file changed. Useful in incident response and malware analysis | `Get-FileHash -Path ".\file.exe"` |

## 5. Run commands on other computers

| Command | What it does | Example |
| --- | --- | --- |
| `Invoke-Command -ScriptBlock` | Runs a command on another computer. Put the command inside `{ }` | `Invoke-Command -ComputerName Server01 -Credential Domain01\User01 -ScriptBlock { Get-Culture }` |
| `Invoke-Command -FilePath` | Runs a whole script file on another computer | `Invoke-Command -FilePath C:\scripts\test.ps1 -ComputerName Server01` |
| `Get-Help Invoke-Command -Examples` | More examples | `Get-Help Invoke-Command -Examples` |

## Related

- Previous: [Command Line (cmd)](./command-line.md) · [Windows Fundamentals](./fundamentals.md)
- Domain context: [Active Directory Basics](./active-directory-basics.md)
- Linux scripting: [Linux Shells](../linux/shells.md) · [cross-platform cheat sheet](../cross-platform.md)

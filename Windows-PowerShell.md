|code|discription|example|
| ------------------ | ------------- | ------------ |
|get-command| essential tool for discovering what commands one can use ||
| get-command -commandtype "Function" |  if we want to display only the available commands of type “function”, |  |
| Get-Help |||
| Get-Alias |||
|Get-Alias -name "echo"| how to get the cmdlet has its traditional counterpart echo as an alias||
|Get-Command -Name Remove*| retrieve a list of commands that start with the verb Remove|||
|Get-Help New-LocalUser -examples|What is the command to retrieve some example usage for the cmdlet New-LocalUser?||
|git-childitem|work like dir and ls||
|set-location -path ".\Documents"| will set the pas to be in document ||
|New-Item -Path xxxxxxxx -ItemType "Directory" or "file"|||
|Remove-Item -Path xxxxxx|||
|Get-ChildItem -Path xxxxx|||
|Get-Content -Path ".\captain-hat.txt"   |||
|Get-ChildItem | Sort-Object Length|get a list of files in a directory and then sort them by size||
| Get-ChildItem | Where-Object -Property "Extension" -eq ".txt"|||
|Get-ChildItem | Where-Object -Property "Name" -like "ship*"|||
|Get-ChildItem | Where-Object -Property Length -gt 100|retrieve the items in the current directory with size greater than 100?||



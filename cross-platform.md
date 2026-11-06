[Home](./README.md) › Cross-platform

# Windows vs Linux cheat sheet

Same task, both operating systems. Everything marked **TODO** is a gap in the notes: fill it in as you study.

| Task | Windows | Linux |
| --- | --- | --- |
| List files | `Get-ChildItem` (alias: `dir`, `ls`) | `ls`, `ls -a` |
| Current directory | `Get-Location` | `pwd` |
| Change directory | `Set-Location -Path ".\Documents"` | `cd` (TODO: add to notes) |
| Read a file | `Get-Content -Path file.txt` | `cat` (TODO: add to notes) |
| Running processes | `Get-Process` | `ps`, `ps aux`, `top` |
| Kill a process | `Stop-Process` (TODO: add to notes) | `kill`, `kill -SIGTERM`, `kill -SIGKILL` |
| Services | `Get-Service` | `systemctl start / stop / enable / disable` |
| Network connections | `netstat -abon`, `Get-NetTCPConnection` | TODO: `ss` / `netstat` |
| IP configuration | `ipconfig /all` | TODO: `ip a` |
| Trace a route | `tracert target` | TODO: `traceroute` |
| DNS lookup | `nslookup target` | TODO: `dig` / `nslookup` |
| File hash | `Get-FileHash` | TODO: `sha256sum` |
| Download a file | TODO: `Invoke-WebRequest` | `wget`, `curl` |
| Become admin / root | TODO: run as Administrator | `sudo su` |
| Run commands remotely | `Invoke-Command` | `ssh`, `scp` for file copy |
| Scheduled tasks | TODO: Task Scheduler | `crontab -e` |

## Notes

- [Windows Command Line](./windows/command-line.md) · [PowerShell](./windows/powershell.md) · [Windows Fundamentals](./windows/fundamentals.md)
- [Linux Fundamentals, Part 3](./linux/fundamentals-part-3.md) · [Linux Shells](./linux/shells.md)

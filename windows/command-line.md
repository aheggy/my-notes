[Home](../README.md) › Windows › Command Line

# Windows Command Line (cmd)

## System information

| Command | Description |
| --- | --- |
| `systeminfo` | Various information about the system: OS information, system details, processor and memory |
| `ver` | Operating system (OS) version |
| `driverquery` | List of installed device drivers |

## Networking

| Command | Description |
| --- | --- |
| `ipconfig` | IP address |
| `ipconfig /all` | More information about the network |
| `tracert (target)` | Trace route: shows the network route traversed to reach the target |
| `nslookup (target)` | Looks up a host or domain and returns its IP address |
| `netstat` or `netstat -abon` | Current network connections and listening ports |
| `netstat -a` | All established connections and listening ports |
| `netstat -b` | Program associated with each listening port and established connection |
| `netstat -o` | Process ID (PID) associated with the connection |
| `netstat -n` | Numerical form for addresses and port numbers |

## Disk and system files

| Command | Description |
| --- | --- |
| `chkdsk` | Checks the file system and disk volumes for errors and bad sectors |
| `sfc /scannow` | Scans system files for corruption and repairs them if possible |

## Related

- Previous: [Windows Fundamentals](./fundamentals.md)
- Next: [PowerShell](./powershell.md), the modern replacement (e.g. `netstat` becomes `Get-NetTCPConnection`)
- Linux equivalents: [cross-platform cheat sheet](../cross-platform.md)

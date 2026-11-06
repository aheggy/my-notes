[Home](../README.md) › Linux › Fundamentals, Part 3

# Linux Fundamentals, Part 3

## Downloading and transferring files

| Command | Description | Example |
| --- | --- | --- |
| `wget` | Download files from the web via HTTP | `wget https://assets.tryhackme.com/additional/linux-fundamentals/part3/myfile.txt` |
| `curl` | | |
| `scp` | Transfer files between computers using ssh | `scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt` |
| `python3 -m http.server` | Start a web server with Python | |

## Listing files

| Command | Description |
| --- | --- |
| `ls -a` | |

## Processes

| Command | Description |
| --- | --- |
| `ps` and `ps aux` | View processes |
| `ps aux \| less` | Locate a flagged process |
| `top` | Live process view, refreshes every 10 seconds |
| `kill (process ID)` | Kill a process |
| `kill -SIGTERM <process ID>` | Kill the process but let it do some cleanup tasks first |
| `kill -SIGKILL <process ID>` | Kill the process with no cleanup |
| `kill -SIGSTOP <process ID>` | Stop/suspend a process |

## Services (systemctl)

| Command | Description |
| --- | --- |
| `systemctl start / stop / enable / disable <service>` | Control a service |
| `systemctl stop "myservice"` | Stop myservice |
| `systemctl enable "myservice"` | Start myservice at boot |

## Scheduling (cron)

| Command | Description |
| --- | --- |
| `crontab -e` | Pick an editor (such as nano) to edit your crontab |

Example crontab entry: back up Documents every 12 hours.

```
0 */12 * * * cp -R /home/cmnatic/Documents /var/backups/
```

## Related

- Next: [Linux Shells](./shells.md): put these commands into scripts
- Windows equivalents: [cross-platform cheat sheet](../cross-platform.md) · [PowerShell](../windows/powershell.md) (`Get-Process`, `Get-Service`)

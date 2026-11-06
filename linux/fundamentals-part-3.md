[Home](../README.md) › Linux › Fundamentals, Part 3

# Linux Fundamentals, Part 3

Type these commands in the Linux terminal. Text in `<angle brackets>` is something you replace, for example `<process ID>` becomes `1234`.

## 1. Download and transfer files

| Command | What it does | Example |
| --- | --- | --- |
| `wget <url>` | Downloads a file from the web and saves it in the current folder | `wget https://assets.tryhackme.com/additional/linux-fundamentals/part3/myfile.txt` |
| `curl <url>` | Fetches a web page and **prints it on the screen** | `curl https://example.com` |
| `curl -O <url>` | Same as `curl`, but **saves it as a file** | `curl -O https://example.com/myfile.txt` |
| `scp <file> <user>@<ip>:<path>` | Copies a file to another computer over SSH | `scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt` |
| `python3 -m http.server` | Turns the current folder into a small website on port 8000, so others can download your files. Stop it with **Ctrl + C** | Run it, then open `http://<your-ip>:8000` in a browser |

## 2. See files

| Command | What it does | Example |
| --- | --- | --- |
| `ls` | Lists files | `ls` |
| `ls -a` | Lists **all** files, including hidden ones (names starting with `.`) | `ls -a` → `.bashrc  .ssh  notes.txt` |

## 3. Processes (running programs)

| Command | What it does | Example |
| --- | --- | --- |
| `ps` | Shows your own running processes | `ps` |
| `ps aux` | Shows **every** process on the system | `ps aux` |
| `ps aux \| less` | Same, but one page at a time so you can scroll (press **q** to quit) | `ps aux \| less` |
| `top` | Live list of processes, updating on its own (press **q** to quit) | `top` |
| `kill <process ID>` | Stops a process | `kill 1234` |
| `kill -SIGTERM <process ID>` | Asks a process to stop **politely** (it can save its work and clean up) | `kill -SIGTERM 1234` |
| `kill -SIGKILL <process ID>` | Forces a process to stop **immediately** (no cleanup) | `kill -SIGKILL 1234` |
| `kill -SIGSTOP <process ID>` | Pauses a process without ending it | `kill -SIGSTOP 1234` |

**Typical flow:** run `ps aux`, find the program, note its PID (the number in the second column), then `kill` it. Try `-SIGTERM` first and use `-SIGKILL` only if it will not stop.

## 4. Services (programs that run in the background)

Use `sudo` in front, because these need admin rights.

| Command | What it does | Example |
| --- | --- | --- |
| `systemctl start <service>` | Starts a service now | `sudo systemctl start apache2` |
| `systemctl stop <service>` | Stops a service now | `sudo systemctl stop apache2` |
| `systemctl enable <service>` | Makes a service start automatically when the computer boots | `sudo systemctl enable apache2` |
| `systemctl disable <service>` | Stops it from starting at boot | `sudo systemctl disable apache2` |

## 5. Scheduled jobs (cron)

| Command | What it does | Example |
| --- | --- | --- |
| `crontab -e` | Opens your list of scheduled jobs in an editor (such as nano) | `crontab -e` |

Each line in the crontab has 5 time fields, then the command:

```
minute  hour  day-of-month  month  day-of-week  command
```

`*` means "every". `*/12` means "every 12".

```
# Copy Documents to /var/backups every 12 hours
0 */12 * * * cp -R /home/cmnatic/Documents /var/backups/

# Run a script every day at 2:30 AM
30 2 * * * /home/ahmed/backup.sh
```

## Related

- Next: [Linux Shells](./shells.md): put these commands into scripts
- Windows equivalents: [cross-platform cheat sheet](../cross-platform.md) · [PowerShell](../windows/powershell.md) (`Get-Process`, `Get-Service`)

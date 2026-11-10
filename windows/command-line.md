[Home](../README.md) › Windows › Command Line

# Windows Command Line (cmd)

Open it: press **Win + R**, type `cmd`, press **Enter**.
Replace `(target)` with a real website or IP address, for example `google.com`.

## System information

| Command | What it does | Example |
| --- | --- | --- |
| `systeminfo` | Shows OS, processor, memory and other system details | `systeminfo` |
| `ver` | Shows the Windows version | `ver` → `Microsoft Windows [Version 10.0.19045]` |
| `driverquery` | Lists the installed device drivers | `driverquery` |

## Networking

| Command | What it does | Example |
| --- | --- | --- |
| `ipconfig` | Shows your IP address | `ipconfig` |
| `ipconfig /all` | Shows full network details (MAC address, DNS, DHCP) | `ipconfig /all` |
| `tracert (target)` | Shows each router your traffic passes through to reach the target | `tracert google.com` |
| `nslookup (target)` | Turns a domain name into an IP address | `nslookup google.com` |
| `arp -a` | Shows the saved list of IP addresses and their MAC addresses (see [ARP](../networking/arp.md)) | `arp -a` |
| `netstat` | Shows current network connections | `netstat` |
| `netstat -a` | Shows all connections **and** the ports waiting for connections | `netstat -a` |
| `netstat -n` | Shows numbers (IPs and ports) instead of names, so it is faster | `netstat -n` |
| `netstat -o` | Adds the **PID** (process ID) that owns each connection | `netstat -o` |
| `netstat -b` | Adds the **program name** that owns each connection (run cmd as Administrator) | `netstat -b` |
| `netstat -abon` | All four options at once. The most useful version | `netstat -abon` |

**How to use `netstat -abon` in practice:** find a suspicious connection, copy its PID, then look it up in Task Manager or with `tasklist /FI "PID eq 1234"`.

## Disk and system files

| Command | What it does | Example |
| --- | --- | --- |
| `chkdsk` | Checks the disk for errors and bad sectors | `chkdsk C:` |
| `sfc /scannow` | Scans Windows system files and repairs damaged ones (run as Administrator) | `sfc /scannow` |

## Related

- Previous: [Windows Fundamentals](./fundamentals.md)
- Next: [PowerShell](./powershell.md), the modern replacement (`netstat` becomes `Get-NetTCPConnection`)
- Concept behind `nslookup`: [DNS](../network-core-protocols/dns.md)
- Concept behind `ipconfig /all`: [DHCP](../networking/dhcp.md)
- Concept behind `arp -a`: [ARP](../networking/arp.md)
- Linux equivalents: [cross-platform cheat sheet](../cross-platform.md)

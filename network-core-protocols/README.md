[Home](../README.md) › Network Core Protocols

# Network Core Protocols

The everyday protocols behind browsing, file transfer and email. They all follow the same idea: **the client sends a short text command, the server sends a reply.** Because they are plain text, you can even "talk" to them yourself with `telnet`.

## At a glance

| Protocol | Job | Default port | Transport | Note |
| --- | --- | --- | --- | --- |
| [DNS](./dns.md) | Turns names into IP addresses | 53 | UDP (TCP fallback) | Records: A, AAAA, CNAME, MX |
| [HTTP](./http.md) | Gets web pages | 80 (8080) | TCP | Methods: GET, POST, PUT, DELETE |
| HTTPS ([HTTP](./http.md)) | Secure version of HTTP | 443 (8443) | TCP | The "S" is Secure |
| [FTP](./ftp.md) | Transfers files | 21 (+ a separate data connection) | TCP | Commands: USER, PASS, RETR, STOR |
| [SMTP](./smtp.md) | **Sends** email | 25 | TCP | Commands: HELO, MAIL FROM, RCPT TO, DATA |
| [POP3](./pop3.md) | **Downloads** email (then deletes it from the server) | 110 | TCP | Commands: USER, PASS, STAT, LIST, RETR |
| [IMAP](./imap.md) | **Syncs** email across devices | 143 | TCP | Commands: LOGIN, SELECT, FETCH |

## Test a protocol by hand with telnet

`telnet <ip> <port>` opens a raw connection. Then you type the protocol's commands.

| Command | What it does |
| --- | --- |
| `telnet MACHINE_IP 80` | Talk to a web server (HTTP) |
| `telnet MACHINE_IP 25` | Talk to a mail server (SMTP) |
| `telnet MACHINE_IP 110` | Read mail (POP3) |
| `telnet MACHINE_IP 143` | Read mail (IMAP) |
| `ftp MACHINE_IP` | FTP uses its own client, `ftp` |

`MACHINE_IP` is the target machine's IP address (in TryHackMe, the IP shown on the room page).

## Security point (important for pentesting)

These protocols send commands **and passwords in plain text**. Anyone who captures the network traffic (for example with Wireshark) can read them. The POP3 note shows a password visible in a capture. HTTPS exists to fix this for web traffic.

## How email fits together

```
You write an email
   |  SMTP (send)        port 25
   v
Mail server  --SMTP-->  recipient's mail server
                              |
              POP3 (download, port 110)  or  IMAP (sync, port 143)
                              v
                     recipient's mail app
```

Post office comparison: **SMTP** is handing your package to the post office. **POP3** is picking up your letters from your mailbox. **IMAP** is checking the same mailbox from several devices.

## Related

- Before these: [DHCP](../networking/dhcp.md) · [ARP](../networking/arp.md)
- Windows and Linux: [cross-platform cheat sheet](../cross-platform.md)

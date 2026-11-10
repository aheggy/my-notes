[Home](../README.md) › [Network Core Protocols](./README.md) › FTP

# FTP (File Transfer Protocol)

HTTP is built to get web pages. **FTP is built to move files**, and it is usually faster at it.

| Fact | Value |
| --- | --- |
| Port | **21** (TCP) for commands |
| Data | Sent on a **separate connection**: the file list and each file get their own |

## Commands

| FTP command (protocol) | What it does | What you type in the `ftp` client |
| --- | --- | --- |
| `USER` | Sends the username | You are asked for it when you connect |
| `PASS` | Sends the password | You are asked for it next |
| `LIST` | Lists files | `ls` |
| `RETR` (retrieve) | **Download** a file from server to you | `get coffee.txt` |
| `STOR` (store) | **Upload** a file from you to the server | `put myfile.txt` |

Note: the words you type in the client (`ls`, `get`) are not the same as what is sent to the server (`LIST`, `RETR`). The client translates them.

## Step-by-step example

| Step | What you type | What it does |
| --- | --- | --- |
| 1 | `ftp MACHINE_IP` | Connect to the FTP server |
| 2 | `anonymous` (as the name) | Log in as the guest user |
| 3 | press Enter (no password needed) | Anonymous login accepts an empty password |
| 4 | `ls` | List the files you can download |
| 5 | `type ascii` | Switch to text mode, because the file is text |
| 6 | `get coffee.txt` | Download the file |
| 7 | `quit` | Disconnect |

```
user@TryHackMe$ ftp MACHINE_IP
220 (vsFTPd 3.0.5)
Name (MACHINE_IP:strategos): anonymous
331 Please specify the password.
Password:
230 Login successful.
ftp> ls
150 Here comes the directory listing.
-rw-r--r--    1 0        0            1480 Jun 27 08:03 coffee.txt
-rw-r--r--    1 0        0              14 Jun 27 08:04 flag.txt
-rw-r--r--    1 0        0            1595 Jun 27 08:05 tea.txt
226 Directory send OK.
ftp> type ascii
200 Switching to ASCII mode.
ftp> get coffee.txt
226 Transfer complete.
ftp> quit
221 Goodbye.
```

(Some lines were removed to keep it short.)

## Reading the numbers

Each server reply starts with a number.

| Code | Meaning |
| --- | --- |
| `220` | Server is ready |
| `331` | Username OK, now send the password |
| `230` | Login successful |
| `150` | Starting the data transfer |
| `226` | Transfer finished OK |
| `221` | Goodbye |

## Good to know

- In the example, `ls` and the download each used their own data connection, separate from the main connection on port 21.
- The warning "bare linefeeds received in ASCII mode" appeared because ASCII mode was used while the server was sending in binary mode. If a downloaded file looks wrong, try `type binary` and download again.
- **Pentesting tip:** always check if a server allows **anonymous** login. It can expose files to anyone.

## Related

- Overview: [Network Core Protocols](./README.md)
- Before: [HTTP](./http.md)
- Next: [SMTP](./smtp.md)

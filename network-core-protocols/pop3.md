[Home](../README.md) › [Network Core Protocols](./README.md) › POP3

# POP3 (Post Office Protocol version 3)

POP3 **downloads** email from the mail server to your mail app.

| Fact | Value |
| --- | --- |
| Port | **110** (TCP) |
| Needs login | Yes (username and password) |

**Post office comparison:** [SMTP](./smtp.md) hands your package to the post office. **POP3 is checking your mailbox for new letters.**

## Commands

| Command | What it does | Example |
| --- | --- | --- |
| `USER <username>` | Says who you are | `USER strategos` |
| `PASS <password>` | Sends your password | `PASS <password>` |
| `STAT` | Number of messages and their total size | `STAT` |
| `LIST` | Lists each message with its size | `LIST` |
| `RETR <number>` | Downloads that message | `RETR 3` |
| `DELE <number>` | Marks that message for deletion | `DELE 3` |
| `QUIT` | Ends the session **and applies changes** such as deletions | `QUIT` |

## Read your mail with telnet

Connect with `telnet MACHINE_IP 110`. Server replies start with `+OK` (success).

```
+OK [XCLIENT] Dovecot (Ubuntu) ready.            <- server: ready
USER strategos                                    <- you
+OK
PASS <password>                                   <- you
+OK Logged in.
STAT                                              <- you: how many messages?
+OK 3 1264                                        <- 3 messages, 1264 bytes total
LIST                                              <- you: list them
+OK 3 messages:
1 407
2 412
3 445
.
RETR 3                                            <- you: download message 3
+OK 445 octets
From: user@client.thm
To: strategos@server.thm
Subject: Telnet email

Hello. I am using telnet to send you an email!
.
QUIT
+OK Logging out.
```

(The long delivery headers were removed to keep it short.)

## Security warning

Everything is sent in **plain text**. Someone capturing the traffic can read your **username and password**. In the room's Wireshark capture, the client's lines are red and the server's lines are blue, and the password is readable.

## Good to know

- POP3 is fine if you read mail on **one device**.
- It normally **removes** the mail from the server after download. To read the same mail on several devices, use [IMAP](./imap.md).

## Related

- Overview: [Network Core Protocols](./README.md)
- Before: [SMTP](./smtp.md) (sending)
- Next: [IMAP](./imap.md)

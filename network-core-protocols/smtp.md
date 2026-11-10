[Home](../README.md) › [Network Core Protocols](./README.md) › SMTP

# SMTP (Simple Mail Transfer Protocol)

SMTP is how an email is **sent**: from your mail app to a mail server, and from one mail server to another.

| Fact | Value |
| --- | --- |
| Port | **25** (TCP) |

**Post office comparison:** you greet the clerk, say where the package goes, give your own details, then hand over the package. An SMTP session is the same steps in the same order.

## Commands

| Command | What it does | Example |
| --- | --- | --- |
| `HELO` or `EHLO` | Starts the session ("hello, I am ...") | `HELO client.thm` |
| `MAIL FROM` | Says who is sending | `MAIL FROM: <user@client.thm>` |
| `RCPT TO` | Says who receives it | `RCPT TO: <strategos@server.thm>` |
| `DATA` | "I am about to send the message itself" | `DATA` |
| `.` | A line with only a dot ends the message | `.` |
| `QUIT` | Closes the session | `QUIT` |

## Send an email with telnet

Connect with `telnet MACHINE_IP 25`, then type the lines marked **you**. The server's replies start with a number.

```
220 example.thm ESMTP Exim 4.95 Ubuntu          <- server: ready
HELO client.thm                                  <- you: start session
250 example.thm Hello client.thm                 <- server: OK
MAIL FROM: <user@client.thm>                     <- you: sender
250 OK
RCPT TO: <strategos@server.thm>                  <- you: recipient
250 Accepted
DATA                                             <- you: message starts
354 Enter message, ending with "." on a line by itself
From: user@client.thm                            <- you: message headers
To: strategos@server.thm
Subject: Telnet email

Hello. I am using telnet to send you an email!   <- you: the message
.                                                <- you: end of message
250 OK id=1sMrpq-0001Ah-UT                       <- server: accepted
QUIT                                             <- you: close
221 example.thm closing connection
```

| Code | Meaning |
| --- | --- |
| `220` | Server is ready |
| `250` | OK, command accepted |
| `354` | Go ahead and send the message, end it with `.` |
| `221` | Closing the connection |

Sending mail by telnet is clumsy, but it shows exactly what your mail app does for you in the background.

## Related

- Overview: [Network Core Protocols](./README.md)
- Before: [FTP](./ftp.md)
- The recipient reads the email with: [POP3](./pop3.md) or [IMAP](./imap.md)
- DNS finds the mail server through the **MX record**: [DNS](./dns.md)

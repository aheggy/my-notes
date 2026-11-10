[Home](../README.md) › [Network Core Protocols](./README.md) › IMAP

# IMAP (Internet Message Access Protocol)

IMAP lets you read your email from **several devices** (office PC, laptop, phone) and keeps them all **in sync**: read, moved and deleted messages look the same everywhere.

| Fact | Value |
| --- | --- |
| Port | **143** (TCP) |

## POP3 vs IMAP

| | [POP3](./pop3.md) | IMAP |
| --- | --- | --- |
| Where the mail lives | Downloaded, usually removed from the server | **Stays on the server** |
| Several devices | Not suited | **Made for it** (synchronized) |
| Server storage | Less | More |
| Commands | Simple | More complicated |

## Commands

| Command | What it does | Example |
| --- | --- | --- |
| `LOGIN <username> <password>` | Logs you in | `A LOGIN strategos <password>` |
| `SELECT <mailbox>` | Opens a mail folder | `B SELECT inbox` |
| `FETCH <number> <item>` | Gets a message (header and body with `body[]`) | `C FETCH 3 body[]` |
| `MOVE <messages> <mailbox>` | Moves messages to another folder | `MOVE 3 Archive` |
| `COPY <messages> <mailbox>` | Copies messages to another folder | `COPY 3 Archive` |
| `LOGOUT` | Logs out | `D LOGOUT` |

**The letters at the start (`A`, `B`, `C`, `D`)** are tags. You choose a tag for each command, and the server repeats it in its answer so you know which command it answers.

## Fetch a message with telnet

Connect with `telnet MACHINE_IP 143`.

```
* OK ... Dovecot (Ubuntu) ready.                  <- server: ready
A LOGIN strategos <password>                      <- you: log in
A OK ... Logged in                                <- server
B SELECT inbox                                    <- you: open the inbox
* 4 EXISTS                                        <- server: 4 messages in the inbox
B OK [READ-WRITE] Select completed
C FETCH 3 body[]                                  <- you: get message 3
* 3 FETCH (BODY[] {445}
From: user@client.thm
To: strategos@server.thm
Subject: Telnet email

Hello. I am using telnet to send you an email!
)
C OK Fetch completed
D LOGOUT                                          <- you: log out
* BYE Logging out
D OK Logout completed
```

(The long capability list and the delivery headers were removed to keep it short.)

You only need **four commands** (LOGIN, SELECT, FETCH, LOGOUT), but the server's answers are long.

## Where this leaves us

HTTP, FTP, SMTP, POP3 and IMAP are all **text-based protocols**: the client sends a command, the server answers. Once you understand one, others are easy to learn.

## Related

- Overview: [Network Core Protocols](./README.md)
- Before: [POP3](./pop3.md) · [SMTP](./smtp.md)

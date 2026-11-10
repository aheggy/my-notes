[Home](../README.md) › Networking › DNS and WHOIS

# DNS (Domain Name System) and WHOIS

*From the TryHackMe Networking room.*

## The problem DNS solves

Nobody remembers the IP address of their favourite websites. **DNS maps a domain name to an IP address**, so you type `example.com` and your computer finds `93.184.215.14` for you.

Your device gets the IP of its DNS server automatically from [DHCP](./dhcp.md).

## Quick facts

| Fact | Value |
| --- | --- |
| OSI layer | Layer 7 (Application) |
| Default transport | **UDP** port **53** |
| Fallback transport | **TCP** port **53** |

## The 4 record types to know

| Record | Stands for | What it does | Example |
| --- | --- | --- | --- |
| **A** | Address | Name → **IPv4** address | `example.com` → `172.17.2.172` |
| **AAAA** | "Quad-A" | Name → **IPv6** address | `example.com` → `2606:2800:21f:cb07:6820:80da:af6b:8b2c` |
| **CNAME** | Canonical Name | Name → **another name** (an alias) | `www.example.com` → `example.com` |
| **MX** | Mail Exchange | Which **mail server** handles email for the domain | email to `test@example.com` goes to the server in the MX record |

Tips:
- Remember **AAAA** with four A's. (AA is a battery size and AAA means Authentication, Authorization and Accounting. Neither is DNS.)
- Browser opens a website → asks DNS for the **A** record.
- Mail server sends an email → asks DNS for the **MX** record.

## Look up a domain: `nslookup`

| Command | What it does | Example |
| --- | --- | --- |
| `nslookup <domain>` | Asks the DNS server for the IP address of a domain | `nslookup www.example.com` |
| `nslookup -type=MX <domain>` | Asks for a specific record type, here the mail server (not from the room) | `nslookup -type=MX example.com` |

Output:

```
Server:         127.0.0.53
Address:        127.0.0.53#53

Non-authoritative answer:
Name:   www.example.com
Address: 93.184.215.14
Name:   www.example.com
Address: 2606:2800:21f:cb07:6820:80da:af6b:8b2c
```

How to read it:
- **Server / Address (top):** the DNS server that answered. `127.0.0.53` is a small DNS service on your own Linux machine that passes your question on.
- **Non-authoritative answer:** the answer came from a DNS server that is not the domain's own server (for example a cache). It is normal.
- **Two addresses:** the first is the IPv4 (A) record, the second is the IPv6 (AAAA) record.

## What happens on the network

One lookup creates **4 packets**: an A query, its answer, an AAAA query, its answer.

Command: `tshark -r dns-query.pcapng -Nn` (`-r` = read a capture file, `-Nn` = resolve network addresses)

```
1 0.000000000 192.168.66.89 → 192.168.66.1 DNS 86  Standard query 0x2e0f A www.example.com OPT
2 0.059049584 192.168.66.1 → 192.168.66.89 DNS 102 Standard query response 0x2e0f A www.example.com A 93.184.215.14 OPT
3 0.059721705 192.168.66.89 → 192.168.66.1 DNS 86  Standard query 0x96e1 AAAA www.example.com OPT
4 0.101568276 192.168.66.1 → 192.168.66.89 DNS 114 Standard query response 0x96e1 AAAA www.example.com AAAA 2606:2800:21f:cb07:6820:80da:af6b:8b2c OPT
```

| Packet | Direction | Meaning |
| --- | --- | --- |
| 1 | you → DNS server | "What is the **A** record of `www.example.com`?" |
| 2 | DNS server → you | "`93.184.215.14`" |
| 3 | you → DNS server | "What is the **AAAA** record?" |
| 4 | DNS server → you | "`2606:2800:...`" |

The ID (`0x2e0f`, `0x96e1`) matches each question to its answer.

## Who controls DNS records? The domain owner

Whoever **registers** a domain name can set any valid DNS records for it.
- You register a domain for 1 or more years and pay a yearly fee.
- You must give **accurate contact details** as the registrant.
- Those details go into the public **WHOIS** record.
- Want to hide your details? Use a **privacy service**. WHOIS then shows the privacy company instead of you.

WHOIS is **not** an acronym. It is read as "who is".

## Look up the owner: `whois`

| Command | What it does | Example |
| --- | --- | --- |
| `whois <domain>` | Shows who registered a domain, when, and with which registrar | `whois example.com` |

A WHOIS record shows:
- registrant name, address, phone and email (unless hidden)
- when the domain was **created**, **last updated** and when it **expires**
- the registrar (the company where it was registered)

Example (a domain with privacy protection):

```
Domain Name: [REDACTED].COM
Registrar WHOIS Server: whois.godaddy.com
Registrar: GoDaddy.com, LLC
Updated Date: 2017-07-05T16:02:43Z
Creation Date: 1993-04-02T00:00:00Z
Registrar Registration Expiration Date: 2026-10-20T14:56:17Z
Registrar Abuse Contact Email: abuse@godaddy.com
Registrant Name: Registration Private
Registrant Organization: Domains By Proxy, LLC
```

How to read it: the registrant is **"Registration Private" / Domains By Proxy**, not a real person. That is the privacy service hiding the owner's details.

Why this matters for security work: `nslookup` and `whois` are among the first steps of **reconnaissance**. They show where a target's servers are, who runs its mail and who owns the domain.

## Related

- Before DNS: [DHCP](./dhcp.md) gives your device its DNS server
- Local network: [ARP](./arp.md)
- Windows: [Command Line (cmd)](../windows/command-line.md) (`nslookup`)
- [Windows vs Linux cheat sheet](../cross-platform.md)

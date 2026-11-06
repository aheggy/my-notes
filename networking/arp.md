[Home](../README.md) › Networking › ARP

# ARP (Address Resolution Protocol)

*From the TryHackMe room "Networking Concepts" follow-up.*

## The problem ARP solves

- Your device usually knows the **IP address** of the other device (for example the router).
- But on the local network (Ethernet or WiFi), data is sent in **frames**, and a frame needs the other device's **MAC address**.
- **ARP** finds the MAC address when you only know the IP address.

In one line: **ARP translates a layer 3 address (IP) into a layer 2 address (MAC).**

## Quick vocabulary

| Term | Simple meaning | Example |
| --- | --- | --- |
| IP address | Logical address of a device on a network | `192.168.66.1` |
| MAC address | Hardware address of the network card. 48 bits, written in hex | `44:DF:65:D8:FE:6C` |
| Frame | The "envelope" used on the local network (layer 2). It carries the IP packet inside | Ethernet (802.3) or WiFi (802.11) |
| Broadcast MAC | A special address that means "send to everyone on this network" | `ff:ff:ff:ff:ff:ff` |
| DHCP | Gives your device its IP address, gateway (router) and DNS server automatically | |

An Ethernet frame header has 3 fields: **destination MAC**, **source MAC** and **type** (for example IPv4).

DHCP gives your device the **IP** of the router and DNS server, but **not their MAC addresses**. That is why ARP is needed.

## How ARP works (2 steps)

Host `192.168.66.89` wants to talk to `192.168.66.1`:

1. **ARP Request** (asks everyone): "Who has `192.168.66.1`? Tell `192.168.66.89`." It is sent to the broadcast address `ff:ff:ff:ff:ff:ff`, so every device on the network hears it.
2. **ARP Reply** (answers only the asker): "`192.168.66.1` is at `44:df:65:d8:fe:6c`."

After that, the two hosts can send each other frames.

```
Host A (192.168.66.89)                         Host B (192.168.66.1)
        |  --- "Who has 192.168.66.1?" (to everyone) --->  |
        |  <--- "192.168.66.1 is at 44:df:65:d8:fe:6c" ---  |
        |  ============ normal frames start ============   |
```

ARP is **not** inside a UDP or IP packet. It sits **directly inside an Ethernet frame**.

Layer 2 or layer 3? Some say layer 2 (it deals with MAC addresses), others say layer 3 (it supports IP). What matters: ARP connects the two.

## Commands

| Command | What it does | Example |
| --- | --- | --- |
| `tshark -r <file> -Nn` | Reads a packet capture file and prints the packets (`-r` = read from file, `-Nn` = resolve network addresses) | `tshark -r arp.pcapng -Nn` |
| `tcpdump -r <file> -n -v` | Same idea with tcpdump (`-r` = read file, `-n` = show numbers, not names, `-v` = more detail) | `tcpdump -r arp.pcapng -n -v` |
| `arp -a` | Shows your computer's saved IP → MAC list (the ARP cache). Works on Windows and Linux | `arp -a` |

### What the output looks like

**tshark** says "Who has ...? Tell ..." for the request and "... is at ..." for the reply:

```
1 0.000000000 cc:5e:f8:02:21:a7 → ff:ff:ff:ff:ff:ff ARP 42 Who has 192.168.66.1? Tell 192.168.66.89
2 0.003566632 44:df:65:d8:fe:6c → cc:5e:f8:02:21:a7 ARP 42 192.168.66.1 is at 44:df:65:d8:fe:6c
```

**tcpdump** uses the words Request and Reply:

```
17:23:44.506615 ARP, Ethernet (len 6), IPv4 (len 4), Request who-has 192.168.66.1 tell 192.168.66.89, length 28
17:23:44.510182 ARP, Ethernet (len 6), IPv4 (len 4), Reply 192.168.66.1 is-at 44:df:65:d8:fe:6c, length 28
```

How to read line 1: source = `cc:5e:f8:02:21:a7` (the asker), destination = `ff:ff:ff:ff:ff:ff` (everyone). Line 2 goes back **only** to the asker.

## Related

- Before ARP: [DHCP](./dhcp.md) gives the device its IP, router and DNS
- Windows: [Command Line (cmd)](../windows/command-line.md) (`ipconfig`, `netstat`)
- Linux: [Fundamentals, Part 3](../linux/fundamentals-part-3.md)
- [Windows vs Linux cheat sheet](../cross-platform.md)

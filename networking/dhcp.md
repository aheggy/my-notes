[Home](../README.md) › Networking › DHCP

# DHCP (Dynamic Host Configuration Protocol)

*From the TryHackMe Networking room (coffee shop WiFi example).*

## The problem DHCP solves

You open your laptop in a coffee shop and it just works. You never typed an IP address. DHCP did the setup for you.

To use any network, a device needs 3 things:

| Setting | What it is | Example |
| --- | --- | --- |
| IP address + subnet mask | Your address on this network | `192.168.66.133` |
| Router (gateway) | The exit door to other networks and the Internet | `192.168.66.1` |
| DNS server | Turns names (`google.com`) into IP addresses | `192.168.66.1` |

**Manual setup** is good for **servers**: they do not move, and other devices expect to find them at a fixed IP.
**DHCP** is better for laptops and phones. It saves you from typing settings on every new network, and it prevents **IP conflicts** (two devices with the same IP, which breaks the network for both).

## Quick facts

| Fact | Value |
| --- | --- |
| Type | Application-level protocol, runs over **UDP** |
| Server listens on | UDP port **67** |
| Client sends from | UDP port **68** |
| Turned on by default on | Phones and laptops |

## DORA: the 4 steps

**D**iscover → **O**ffer → **R**equest → **A**cknowledge

| Step | Message | Who sends | Plain meaning |
| --- | --- | --- | --- |
| 1. Discover | `DHCPDISCOVER` | Client (broadcast) | "Is there a DHCP server here? I need an IP!" |
| 2. Offer | `DHCPOFFER` | Server | "You can use `192.168.66.133`." |
| 3. Request | `DHCPREQUEST` | Client | "Yes please, I accept that address." |
| 4. Acknowledge | `DHCPACK` | Server | "Confirmed. It is yours (leased to you)." |

```
Laptop                                          DHCP server (192.168.66.1)
  | --- 1. Discover: "any DHCP server here?" (to everyone) -->  |
  | <-- 2. Offer:    "use 192.168.66.133"                  ---  |
  | --- 3. Request:  "I accept 192.168.66.133"             -->  |
  | <-- 4. ACK:      "confirmed, it's yours"               ---  |
```

An easy way to remember it: **DORA**, like the explorer.

## Real capture

Command: `tshark -r DHCP-G5000.pcap -n` (`-r` = read a capture file, `-n` = show numbers, not names)

```
1   0.000000      0.0.0.0 → 255.255.255.255 DHCP 342 DHCP Discover - Transaction ID 0xfb92d53f
2   0.013904 192.168.66.1 → 192.168.66.133  DHCP 376 DHCP Offer    - Transaction ID 0xfb92d53f
3   4.115318      0.0.0.0 → 255.255.255.255 DHCP 342 DHCP Request  - Transaction ID 0xfb92d53f
4   4.228117 192.168.66.1 → 192.168.66.133  DHCP 376 DHCP ACK      - Transaction ID 0xfb92d53f
```

How to read it:
- **Source `0.0.0.0`:** the client has no IP yet, so it uses `0.0.0.0`.
- **Destination `255.255.255.255`:** the broadcast IP, meaning "everyone on this network". At layer 2 the client also uses the broadcast MAC `ff:ff:ff:ff:ff:ff`.
- **Packets 1 and 3** (Discover and Request) come from the client.
- **Packets 2 and 4** (Offer and ACK) come from the server `192.168.66.1`, sent to the offered address `192.168.66.133`.
- **Same Transaction ID** (`0xfb92d53f`) on all four packets. It shows they belong to the same conversation.
- The client ends up with the address `192.168.66.133`.

## What you get at the end

1. A **leased IP address** (you borrow it for a while)
2. A **gateway** to send packets outside the local network
3. A **DNS server** to resolve domain names

## Commands to try (not from the room)

| Command | What it does | Example |
| --- | --- | --- |
| `ipconfig /all` | Windows: shows your IP, gateway, DNS and the DHCP server | `ipconfig /all` |
| `ipconfig /release` | Windows: gives your IP back | `ipconfig /release` |
| `ipconfig /renew` | Windows: asks the DHCP server for a new IP (runs DORA again) | `ipconfig /renew` |

## Related

- Next step in the same flow: [ARP](./arp.md) finds the router's MAC address (DHCP gives only its IP)
- Next: [DNS](../network-core-protocols/dns.md): what your device does with the DNS server DHCP gave it
- Windows: [Command Line (cmd)](../windows/command-line.md)
- [Windows vs Linux cheat sheet](../cross-platform.md)

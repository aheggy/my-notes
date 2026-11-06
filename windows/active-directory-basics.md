[Home](../README.md) › Windows › Active Directory Basics

# Active Directory Basics

**Active Directory (AD)** is how a company manages all its Windows computers and users from one place. **Group Policy (GPO)** is a set of rules (for example "password must be 12 characters") that AD pushes to computers.

| Command | What it does | Example |
| --- | --- | --- |
| `gpupdate /force` | Makes a computer download and apply the latest Group Policy **right now** instead of waiting. Run it on the computer you want to update | Run `cmd` as Administrator, then type `gpupdate /force` |

## Related

- Run it from: [Command Line (cmd)](./command-line.md) · [PowerShell](./powershell.md)
- Background: [Windows Fundamentals](./fundamentals.md)

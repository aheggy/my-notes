[Home](../README.md) › Windows › Fundamentals

# Windows Fundamentals

## How to use these commands

Press **Win + R** to open the Run box, type the command, then press **Enter**. You can also type them in `cmd` or PowerShell.

## Tools you can open with a command

| Command | What it opens | Example |
| --- | --- | --- |
| `control.exe` | Control Panel | Win + R → `control.exe` |
| `control /name Microsoft.Troubleshooting` | Troubleshooting | Win + R → `control /name Microsoft.Troubleshooting` |
| `control /name Microsoft.WindowsUpdate` | Windows Update | Win + R → `control /name Microsoft.WindowsUpdate` |
| `UserAccountControlSettings.exe` | User Account Control (UAC) settings: how often Windows asks "Do you allow this app to make changes?" | Win + R → `UserAccountControlSettings.exe` |
| `compmgmt.msc` | Computer Management (users, disks, services, event logs) | Win + R → `compmgmt.msc` |
| `msinfo32` | System Information: hardware and OS details on one screen | Win + R → `msinfo32` |
| `resmon` | Resource Monitor: live CPU, memory, disk and network use | Win + R → `resmon` |
| `regedt32.exe` | Registry Editor (be careful: wrong changes can break Windows) | Win + R → `regedt32.exe` |
| `WF.msc` | Windows Defender Firewall settings | Win + R → `WF.msc` |

## Two quick identity commands

| Command | What it does | Example |
| --- | --- | --- |
| `hostname` | Shows the computer's name | `hostname` → `DESKTOP-AB12CD` |
| `whoami` | Shows the user you are logged in as | `whoami` → `desktop-ab12cd\ahmed` |

## Concept: TPM

**TPM (Trusted Platform Module)** is a small security chip in the computer.
- It stores secrets such as encryption keys.
- It is tamper-resistant, so malware cannot easily change or steal what is inside.
- Example use: BitLocker disk encryption can keep its key in the TPM.

## Related

- Next: [Command Line (cmd)](./command-line.md) · [PowerShell](./powershell.md)
- Domain environments: [Active Directory Basics](./active-directory-basics.md)
- Linux side: [cross-platform cheat sheet](../cross-platform.md)

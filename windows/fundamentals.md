[Home](../README.md) › Windows › Fundamentals

# Windows Fundamentals

## Tools and the commands that open them

| Command | Description |
| --- | --- |
| `control.exe` | Control Panel |
| `C:\Windows\System32\control.exe /name Microsoft.Troubleshooting` | Windows Troubleshooting |
| `control /name Microsoft.WindowsUpdate` | Windows Update (from the Run dialog or cmd) |
| `UserAccountControlSettings.exe` | User Account Control settings |
| `compmgmt.msc` | Computer Management |
| `msinfo32` | System Information tool |
| `resmon` | Resource Monitor |
| `regedt32.exe` | Registry Editor |
| `WF.msc` | Windows Defender Firewall |
| `hostname` and `whoami` | Machine name and current user |
| `C:\Windows\System32\cmd.exe /k %windir%\system32\ipconfig.exe` | Full command for Internet Protocol configuration |

## Concepts

**Trusted Platform Module (TPM):** technology designed to provide hardware-based, security-related functions. A TPM chip is a secure crypto-processor that carries out cryptographic operations. The chip includes multiple physical security mechanisms to make it tamper-resistant, and malicious software cannot tamper with its security functions.

## Related

- Next: [Command Line (cmd)](./command-line.md) · [PowerShell](./powershell.md)
- Domain environments: [Active Directory Basics](./active-directory-basics.md)
- Linux side: [cross-platform cheat sheet](../cross-platform.md)

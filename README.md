# my-notes

Study notes for my cybersecurity / pentesting path (mostly command cheat sheets from TryHackMe rooms).

## Start here

- [Windows vs Linux cheat sheet](./cross-platform.md): same task, both OSes, side by side

## Windows

Read in this order:

1. [Windows Fundamentals](./windows/fundamentals.md): built-in tools and the commands that open them
2. [Command Line (cmd)](./windows/command-line.md): system and network info from `cmd`
3. [PowerShell](./windows/powershell.md): cmdlets, filtering, services, processes, remote execution
4. [Active Directory Basics](./windows/active-directory-basics.md): domain and Group Policy commands

## Linux

1. [Linux Fundamentals, Part 3](./linux/fundamentals-part-3.md): file transfer, processes, services, cron
2. [Linux Shells](./linux/shells.md): bash scripting basics ([example scripts](./linux/shells-example.sh))

## Map

```
windows/   fundamentals -> command-line -> powershell -> active-directory-basics
linux/     fundamentals-part-3 -> shells -> shells-example.sh
cross-platform.md   links the two sides together
```

## Adding a new note

1. Put it in `windows/` or `linux/` (or create a new topic folder, e.g. `networking/`).
2. Use a lowercase-with-dashes file name.
3. Copy the header and "Related" footer from an existing note.
4. Add it to the list above.

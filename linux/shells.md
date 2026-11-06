[Home](../README.md) › Linux › Shells

# Linux Shells (bash scripting)

A **script** is a text file of commands that Linux runs one after another. A bash script ends in `.sh`.

## The 3 steps to make and run a script

| Step | Command | What it does |
| --- | --- | --- |
| 1. Create | `nano hello.sh` | Opens the nano editor to write the script. Save with **Ctrl + X**, then **Y**, then **Enter** |
| 2. Allow running | `chmod +x hello.sh` | Gives the file permission to be executed |
| 3. Run | `./hello.sh` | Runs the script (`./` means "in this folder") |

## Other useful commands

| Command | What it does | Example |
| --- | --- | --- |
| `pwd` | Shows which folder you are in | `pwd` → `/home/ahmed` |
| `sudo su` | Switches you to the **root** (admin) user | `sudo su` (type `exit` to go back) |

## Script 1: say hello

Put this inside `hello.sh`. The first line `#!/bin/bash` tells Linux to run the file with bash.

```bash
#!/bin/bash
echo "Hey, what's your name?"   # echo prints text
read name                       # read saves what you type in the variable "name"
echo "Welcome, $name"           # $name uses the saved value
```

Run it:
```
$ ./hello.sh
Hey, what's your name?
John
Welcome, John
```

## Script 2: a loop (repeat something)

```bash
#!/bin/bash
for i in {1..10}; do   # repeat for i = 1, 2, 3 ... 10
  echo $i
done
```

Output: the numbers `1` to `10`, one per line.

## Script 3: a decision (if / else)

```bash
#!/bin/bash
echo "Please enter your name first:"
read name
if [ "$name" = "Stewart" ]; then
  echo "Welcome Stewart! Here is the secret: THM_Script"
else
  echo "Sorry! You are not authorized to access the secret."
fi
```

- If you type `Stewart` you get the secret.
- Anything else gets "Sorry!".

## Script 4: loop + decisions together (locker)

It asks 3 questions, one per loop round, then checks all the answers.

```bash
#!/bin/bash
username=""
companyname=""
pin=""

for i in {1..3}; do
  if [ "$i" -eq 1 ]; then
    echo "Enter your Username:"
    read username
  elif [ "$i" -eq 2 ]; then
    echo "Enter your Company name:"
    read companyname
  else
    echo "Enter your PIN:"
    read pin
  fi
done

if [ "$username" = "John" ] && [ "$companyname" = "Tryhackme" ] && [ "$pin" = "7385" ]; then
  echo "Authentication Successful. You can now access your locker, John."
else
  echo "Authentication Denied!!"
fi
```

Quick reference for the symbols used:

| Symbol | Meaning |
| --- | --- |
| `=` | text is equal (inside `[ ]`) |
| `-eq` | number is equal |
| `&&` | AND: both must be true |
| `elif` | "else if": another condition to try |
| `fi` / `done` | ends an `if` / ends a `for` loop |

All four scripts are also in one file: [shells-example.sh](./shells-example.sh).

## Related

- Previous: [Linux Fundamentals, Part 3](./fundamentals-part-3.md)
- Windows scripting: [PowerShell](../windows/powershell.md) · [cross-platform cheat sheet](../cross-platform.md)

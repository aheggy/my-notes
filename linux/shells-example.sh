#!/bin/bash
# Four small bash examples in one file. Run with:  chmod +x shells-example.sh && ./shells-example.sh
# Explained step by step in shells.md

# ---------- Example 1: say hello ----------
echo "Hey, what's your name?"
read name
echo "Welcome, $name"

# ---------- Example 2: loop 1 to 10 ----------
for i in {1..10}; do
  echo $i
done

# ---------- Example 3: if / else ----------
echo "Please enter your name first:"
read name
if [ "$name" = "Stewart" ]; then
  echo "Welcome Stewart! Here is the secret: THM_Script"
else
  echo "Sorry! You are not authorized to access the secret."
fi

# ---------- Example 4: locker (loop + if) ----------
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

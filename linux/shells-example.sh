user@tryhackme:~$ nano first_script.sh

# Defining the Interpreter 
#!/bin/bash
echo "Hey, what’s your name?"
read name
echo "Welcome, $name"

user@tryhackme:~$ chmod +x first_script.sh


user@ubuntu:~$ ./first_script.sh
Hey, What's your name?
John
Welcome, John


user@tryhackme:~$ nano loop_script.sh
# Defining the Interpreter 
#!/bin/bash
for i in {1..10};
do
echo $i
done

user@tryhackme:~$ chmod +x loop_script.sh
user@tryhackme:~$ ./loop_script.sh
1
2
3

user@tryhackme:~$ nano conditional_script.sh
# Defining the Interpreter 
#!/bin/bash
echo "Please enter your name first:"
read name
if [ "$name" = "Stewart" ]; then
        echo "Welcome Stewart! Here is the secret: THM_Script"
else
        echo "Sorry! You are not authorized to access the secret."
fi

nano locker.sh
# Defining the variables
username=""
companyname=""
pin=""

# Defining the loop
for i in {1..3}; do
# Defining the conditional statements
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

# Checking if the user entered the correct details
if [ "$username" = "John" ] && [ "$companyname" = "Tryhackme" ] && [ "$pin" = "7385" ]; then
        echo "Authentication Successful. You can now access your locker, John."
else
        echo "Authentication Denied!!"
fi


# press control +x to save than Y than enter

user@tryhackme:~$ chmod +x locker.sh to give permision for excution
user@tryhackme:~$ ./locker.sh


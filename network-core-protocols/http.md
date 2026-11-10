[Home](../README.md) › [Network Core Protocols](./README.md) › HTTP

# HTTP and HTTPS

**HTTP (Hypertext Transfer Protocol)** is how your browser talks to web servers. **HTTPS** is the same with **S**ecure added. Both run on **TCP**.

| Fact | Value |
| --- | --- |
| HTTP port | **80** (sometimes 8080) |
| HTTPS port | **443** (sometimes 8443) |

## The 4 main methods

A method tells the server what you want to do.

| Method | What it does | Example |
| --- | --- | --- |
| `GET` | **Get** data from the server | Open a web page or load an image |
| `POST` | **Send** new data to the server | Submit a login form, upload a file |
| `PUT` | **Create** a resource, or **overwrite** an existing one | Update a saved profile |
| `DELETE` | **Delete** a file or resource | Remove an uploaded file |

## What happens behind the scenes

When your browser shows a page, much more is exchanged than you see. Tools like Wireshark show the full text, including things the page does not display, such as the **web server version** and **when the page was last modified**.

## Talk HTTP yourself with telnet

This is great for troubleshooting, because you see exactly what the server answers.

| Step | What you do | Example |
| --- | --- | --- |
| 1. Connect | Open a connection to port 80 | `telnet MACHINE_IP 80` |
| 2. Ask for the page | Type the request line | `GET / HTTP/1.1` |
| 3. Name the site | Type the Host line, then press Enter twice | `Host: anything` |

- `/` means the default page. To get a specific file, change it: `GET /file.html HTTP/1.1`.
- On some servers the `Host:` line is not required, and `GET /file.html` alone may work.

## Related

- Overview: [Network Core Protocols](./README.md)
- Before this: [DNS](./dns.md) finds the server's IP first
- Next: [FTP](./ftp.md)

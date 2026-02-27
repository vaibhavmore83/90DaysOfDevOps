# Networking Concepts: DNS, IP, Subnets & Ports  

## DNS – How Names Become IPs  

What happens when you type google.com in a browser?  
Ans: When you type google.com in a browser (Application Layer), the browser uses DNS to translate the domain into an IP address.  
Then it establishes secure HTTP connection using TCP protocol, sends request to server, receives webpages from www and then renders them.  

What are these record types?  
Ans: These are different DNS record types.  
**A** - (Address), maps a hostname directly to an IPv4 address to locate web servers.  
**AAAA** - (IPv6 Address), maps a hostname to an IPv6 address, acting as the modern counterpart to A records.  
**CNAME** - (Canonical Name), maps an alias or subdomain to another domain name instead of an IP address.  
**MX** - (Mail Exchanger), directs email to the appropriate mail server responsible for a domain.  
**NS** - (Name Server), delegates a domain or subdomain to a specific set of authoritative DNS servers.  

Run: dig google.com — identify the A record and TTL from the output  
Ans: **dig google.com**
```bash
ubuntu@ip-172-31-27-126:~$ dig google.com

; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 16986
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             251     IN      A       142.251.143.142

;; Query time: 1 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Feb 27 10:20:32 UTC 2026
;; MSG SIZE  rcvd: 55

ubuntu@ip-172-31-27-126:~$
```
The **A** record shows the IP address **142.251.143.142**.  
The **TTL** (Time to Live) is **251**.  

---  

## IP Addressing  

What is an IPv4 address? How is it structured?  
Ans: An IPv4 address (Internet Protocol version 4) is a unique 32-bit numerical label assigned to devices connected to a network, enabling them to communicate. It acts as a logical identifier for locating devices.  
It is structured as four 8-bit octets separated by dots (e.g. 192.168.1.10), it represents values between 0 and 255 per segment.  

Difference between public and private IPs.  
Ans: Public IP addresses are globally unique identifiers to enable direct, external internet access; while private IPs are used internally within local networks (LANs) for device communication.  
Public IPs are visible worldwide; whereas private IPs are re-usable and secure.  
E.g.  
Private IP for Home Router: 192.168.1.1
Public IP for an external web server: 17.5.7.8  

What are the private IP ranges?  
**10.x.x.x** - Provides the largest address space with 16,777,216 addresses (10.0.0.0 to 10.255.255.255).  
**172.16.x.x – 172.31.x.x** - Ranges from 172.16.0.0 to 172.31.255.255 (over 1 million addresses).  
**192.168.x.x** - Common in home routers, ranging from 192.168.0.0 to 192.168.255.255 (65,536 addresses).  

Run **ip addr show** — identify which of your IPs are private  
Ans: 
```bash
ubuntu@ip-172-31-27-126:~$ ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: ens5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 06:97:84:3d:91:7b brd ff:ff:ff:ff:ff:ff
    inet 172.31.27.126/20 metric 100 brd 172.31.31.255 scope global dynamic ens5
       valid_lft 3593sec preferred_lft 3593sec
    inet6 fe80::497:84ff:fe3d:917b/64 scope link
       valid_lft forever preferred_lft forever
ubuntu@ip-172-31-27-126:~$
```
---  

## CIDR & Subnetting  

What does /24 mean in 192.168.1.0/24?  
Ans: /24 is the CIDR notation which means the first 24 bits of the 32-bit address are the network portion, leaving 8 bits for hosts.  

How many usable hosts in a /24? A /16? A /28?  
Ans:  
/24: 254 usable hosts  
/16: 65,534 usable hosts  
/28: 14 usable hosts  

Explain in your own words: why do we subnet?  
Ans: Subnet is used to divide large network into smaller and secure sub networks. It optimizes IP Address allocation.  
  
| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-----------------|---------|------------|
| /24  | 255.255.255.0   | 256     | 254        |
| /16  | 255.255.0.0     | 65,536  | 65,534     |
| /28  | 255.255.255.240 | 16      | 14         |

---  

## Ports – The Doors to Services  

What is a port? Why do we need them?  
Ans: A port is a virtual, software-based endpoint (numbered 0–65535) managed by the operating system that identifies specific services or applications on a device.  
Ports are crucial because they allow a single IP address to handle multiple, concurrent, and distinct network connections (e.g., browsing, email, file transfers) simultaneously.  

Document these common ports:  
  
| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 53   | DNS     |
| 3306 | MySQL   |
| 6379 | Redis   |
| 27017| MongoDB |

Run **ss -tulpn** — match at least 2 listening ports to their services  
Ans:  
```bash
ubuntu@ip-172-31-27-126:~$ ss -tulpn
Netid           State            Recv-Q            Send-Q                            Local Address:Port                       Peer Address:Port           Process
udp             UNCONN           0                 0                                     127.0.0.1:323                             0.0.0.0:*
udp             UNCONN           0                 0                                    127.0.0.54:53                              0.0.0.0:*
udp             UNCONN           0                 0                                 127.0.0.53%lo:53                              0.0.0.0:*
udp             UNCONN           0                 0                            172.31.27.126%ens5:68                              0.0.0.0:*
udp             UNCONN           0                 0                                         [::1]:323                                [::]:*
tcp             LISTEN           0                 4096                              127.0.0.53%lo:53                              0.0.0.0:*
tcp             LISTEN           0                 4096                                 127.0.0.54:53                              0.0.0.0:*
tcp             LISTEN           0                 4096                                    0.0.0.0:22                              0.0.0.0:*
tcp             LISTEN           0                 511                                     0.0.0.0:80                              0.0.0.0:*
tcp             LISTEN           0                 4096                                       [::]:22                                 [::]:*
tcp             LISTEN           0                 511                                        [::]:80                                 [::]:*
ubuntu@ip-172-31-27-126:~$
```
---  

## Putting It Together  

You run **curl http://myapp.com:8080** — what networking concepts from today are involved?  
Ans: Network and Transport Layers. The curl will give you a raw HTML source code of the website's landing page.  

Your app can't reach a database at **10.0.1.50:3306** — what would you check first?  
Ans: I should first check the basic network connectivity between my application and the database server.  

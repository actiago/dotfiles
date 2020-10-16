# My script list

```bash
sudo nmap -sP 10.0.0.0/24 | awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " => "$3;}' | sort
```

```bash
lynx -listonly -dump www.site.com
```

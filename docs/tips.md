# Dicas

- Extract HTTP Passwords in POST Requests
```bash
sudo tcpdump -s 0 -A -n -l | egrep -i "POST /|pwd=|passwd=|password=|Host:"
```
- Capture FTP Credentials and Commands
```bash
sudo tcpdump -nn -v port ftp or ftp-data
```
- Capture all plaintext passwords
```bash
sudo tcpdump port http or port ftp or port smtp or port imap or port pop3 or port telnet -l -A | egrep -i -B5 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user '
```
- Display live hosts on the network
```bash
nmap -sP "$(ip -4 -o route get 1 | cut -d ' ' -f 7)"/24 | grep report | cut -d ' ' -f 5-
```
- Generate a self-signed certificate
```bash
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt
```

- See all online IPs in your network
```bash
for x in {1..255} ; do (ping 192.168.1.255 -c 1 -w 5 >/dev/null && echo 192.168.1.255 &) ; done
```



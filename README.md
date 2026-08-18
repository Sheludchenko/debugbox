Minimal troubleshooting image for Kubernetes clusters and local Docker. 

## Docker

```bash
docker pull ghcr.io/sheludchenko/debugbox:latest
docker run --rm -it ghcr.io/sheludchenko/debugbox:latest
```

Build locally:

```bash
docker build -t ghcr.io/sheludchenko/debugbox:latest .
```

## Kubernetes

```bash
kubectl run debugbox --rm -it --image=ghcr.io/sheludchenko/debugbox:latest --restart=Never -- /bin/bash
```

## Tools


| Tool              | Purpose                |
| ----------------- | ---------------------- |
| `curl`, `wget`    | HTTP                   |
| `dig`, `nslookup` | DNS                    |
| `ip`, `ss`        | Interfaces and sockets |
| `ping`            | ICMP                   |
| `nc`              | TCP/UDP                |
| `tcping`          | TCP port connectivity  |
| `traceroute`      | Path tracing           |
| `tcpdump`         | Packet capture         |
| `openssl`         | TLS and certificates   |
| `jq`, `yq`        | JSON and YAML          |
| `psql`            | PostgreSQL             |
| `mysql`           | MySQL                  |
| `sqlcmd`          | SQL Server             |


Interactive bash includes `cls` as an alias for `clear`.

## Usage

```bash
# HTTP
curl -I https://example.com
wget -qO- https://example.com

# DNS
dig example.com
nslookup example.com

# Interfaces and sockets
ip addr
ip route
ss -lntup

# ICMP
ping -c 4 example.com

# TCP/UDP
nc -vz example.com 443
echo ping | nc example.com 80

# TCP port connectivity
tcping example.com 443

# Path tracing
traceroute example.com

# Packet capture
tcpdump -i any -nn port 443

# TLS and certificates
openssl s_client -connect example.com:443 -servername example.com </dev/null
echo | openssl s_client -connect example.com:443 2>/dev/null | openssl x509 -noout -dates -subject

# JSON and YAML
echo '{"ok":true}' | jq .
echo 'ok: true' | yq .

# PostgreSQL
psql -h HOST -p 5432 -U USER -d DATABASE

# MySQL
mysql -h HOST -P 3306 -u USER -p DATABASE

# SQL Server
sqlcmd -S HOST,1433 -U USER -P PASSWORD -d DATABASE -Q "SELECT 1"
```


# Nginx Reverse Proxy with HTTPS

A Docker container that acts as a reverse proxy with HTTPS support, configured via environment variables.

## Features

- ✅ HTTPS/TLS 1.2 & 1.3 support
- ✅ Automatic HTTP to HTTPS redirect
- ✅ Security headers (HSTS, X-Frame-Options, etc.)
- ✅ Configurable backend URL via environment variables
- ✅ SSL certificate path configuration
- ✅ Proper proxy headers (X-Real-IP, X-Forwarded-For)

## Quick Start

### Using Docker

```bash
docker run -d \\
  --name nginx-proxy \\
  -p 5443:443 \\
  -e BACKEND\_URL=http://your-backend:8080 \\
  -e SSL\_CERT\_PATH=/etc/nginx/ssl/cert.crt \\
  -e SSL\_KEY\_PATH=/etc/nginx/ssl/key.key \\
  -e PUBLIC_PORT=5443 \\
  -v /path/to/cert.crt:/etc/nginx/ssl/cert.crt:ro \\
  -v /path/to/key.key:/etc/nginx/ssl/key.key:ro \\
  ghcr.io/waveinch/nginx-reverse-proxy:latest

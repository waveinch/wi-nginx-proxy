#!/bin/sh
set -e

# Validate required environment variables
if [ -z "$BACKEND_URL" ]; then
    echo "ERROR: BACKEND_URL environment variable is not set"
    exit 1
fi

if [ -z "$SSL_CERT_PATH" ]; then
    echo "ERROR: SSL_CERT_PATH environment variable is not set"
    exit 1
fi

if [ -z "$SSL_KEY_PATH" ]; then
    echo "ERROR: SSL_KEY_PATH environment variable is not set (default: /etc/nginx/ssl/key.key)"
    SSL_KEY_PATH="/etc/nginx/ssl/key.key"
fi

# Verify SSL certificate exists
if [ ! -f "$SSL_CERT_PATH" ]; then
    echo "ERROR: SSL certificate not found at $SSL_CERT_PATH"
    exit 1
fi

# Verify SSL key exists
if [ ! -f "$SSL_KEY_PATH" ]; then
    echo "ERROR: SSL key not found at $SSL_KEY_PATH"
    exit 1
fi

# Substitute environment variables in the nginx config template
envsubst '${BACKEND_URL},${SSL_CERT_PATH},${SSL_KEY_PATH}' \
    < /etc/nginx/nginx.conf.template \
    > /etc/nginx/nginx.conf

echo "Nginx configuration generated successfully"
echo "Backend URL: $BACKEND_URL"
echo "SSL Certificate: $SSL_CERT_PATH"
echo "SSL Key: $SSL_KEY_PATH"

# Execute the main command
exec "$@"

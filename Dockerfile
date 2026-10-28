FROM nginx:alpine

# Install envsubst (from gettext package)
RUN apk add --no-cache gettext

# Copy nginx configuration template
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

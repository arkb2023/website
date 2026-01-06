FROM httpd:2.4-alpine

COPY . /usr/local/apache2/htdocs/

EXPOSE 80

# Health check - verify Apache is responding
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

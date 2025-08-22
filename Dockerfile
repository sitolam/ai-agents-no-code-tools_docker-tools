FROM n8nio/n8n:1.107.2
USER root
RUN apk add --no-cache docker-compose

# Make sure su-exec is installed
RUN apk add --no-cache su-exec

# Copy your entrypoint script
COPY docker-entrypoint-docker.sh /usr/local/bin/docker-entrypoint-docker.sh
RUN chmod +x /usr/local/bin/docker-entrypoint-docker.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint-docker.sh"]
CMD ["n8n"]

USER node

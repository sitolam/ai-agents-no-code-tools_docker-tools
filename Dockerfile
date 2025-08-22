FROM n8nio/n8n:1.107.2
USER root
RUN apk add --no-cache docker-compose \
 && addgroup -S docker \
 && adduser node docker      # <-- add node user to docker group
USER node

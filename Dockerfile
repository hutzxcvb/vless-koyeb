FROM alpine

RUN apk add --no-cache curl caddy sing-box

WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
COPY config.json /etc/sing-box/config.json
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
FROM alpine:latest

RUN apk add --no-cache curl bash

# 下载并解压正确的 sing-box
RUN curl -L -o /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-linux-amd64.tar.gz && \
    tar -xzf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box /usr/local/bin/sing-box && \
    chmod +x /usr/local/bin/sing-box

# 下载 Caddy
RUN curl -L -o /usr/local/bin/caddy https://github.com/caddyserver/caddy/releases/latest/download/caddy_linux_amd64 && \
    chmod +x /usr/local/bin/caddy

COPY config.json /etc/sing-box/config.json
COPY Caddyfile /etc/caddy/Caddyfile
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 443 80

ENTRYPOINT ["/entrypoint.sh"]

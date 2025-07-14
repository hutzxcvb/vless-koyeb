FROM alpine:latest

ENV SINGBOX_VER=1.9.5
ENV CADDY_VER=v2.8.4

RUN apk add --no-cache curl bash

# 下载并安装 sing-box
RUN curl -L -o /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v${SINGBOX_VER}/sing-box-${SINGBOX_VER}-linux-amd64.tar.gz && \
    tar -xzf /tmp/sing-box.tar.gz -C /tmp && \
    mv /tmp/sing-box-${SINGBOX_VER}-linux-amd64/sing-box /usr/local/bin/sing-box && \
    chmod +x /usr/local/bin/sing-box

# 下载并安装 caddy
RUN curl -L -o /usr/local/bin/caddy https://github.com/caddyserver/caddy/releases/download/${CADDY_VER}/caddy_${CADDY_VER}_linux_amd64 && \
    chmod +x /usr/local/bin/caddy

COPY config.json /etc/sing-box/config.json
COPY Caddyfile /etc/caddy/Caddyfile
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 443 8080

ENTRYPOINT ["/entrypoint.sh"]

FROM alpine:latest

RUN apk add --no-cache curl bash

# 下载安装 sing-box 最新的 Linux amd64 版本二进制文件
RUN curl -L -o /usr/local/bin/sing-box https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-linux-amd64 && \
    chmod +x /usr/local/bin/sing-box

# 下载安装 caddy
RUN curl -L -o /usr/local/bin/caddy https://github.com/caddyserver/caddy/releases/latest/download/caddy_linux_amd64 && \
    chmod +x /usr/local/bin/caddy

COPY config.json /etc/sing-box/config.json
COPY Caddyfile /etc/caddy/Caddyfile
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 443 80

ENTRYPOINT ["/entrypoint.sh"]

#!/bin/sh

# 启动 Caddy
/usr/local/bin/caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &

# 启动 sing-box
/usr/local/bin/sing-box run -c /etc/sing-box/config.json

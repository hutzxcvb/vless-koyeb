#!/bin/bash
# 启动 Caddy 和 sing-box

# 启动 Caddy (后台)
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &

# 启动 sing-box (前台，保持容器运行)
sing-box run -c /etc/sing-box/config.json

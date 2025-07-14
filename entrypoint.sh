#!/bin/sh
caddy run --config /etc/caddy/Caddyfile &
sing-box run -c /etc/sing-box/config.json
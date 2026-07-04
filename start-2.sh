#!/bin/sh
set -e

# Render injects the port to listen on via $PORT — we must use it, not a hardcoded one
: "${PORT:=10000}"
: "${UUID:=}"
: "${WS_PATH:=vlesspath}"

if [ -z "$UUID" ]; then
  echo "ERROR: UUID environment variable is not set. Set it in Render dashboard."
  exit 1
fi

sed -e "s/PORT_PLACEHOLDER/${PORT}/g" \
    -e "s/UUID_PLACEHOLDER/${UUID}/g" \
    -e "s/PATH_PLACEHOLDER/${WS_PATH}/g" \
    /app/config.template.json > /app/config.json

echo "Starting Xray on port ${PORT} with path /${WS_PATH}"
exec /usr/local/bin/xray run -config /app/config.json

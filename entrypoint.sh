#!/bin/sh
set -e
PORT="${PORT:-8080}"

sed -e "s/__PORT__/${PORT}/g" \
    -e "s/__UUID__/${XRAY_UUID}/g" \
    -e "s/__WSPATH__/${WS_PATH:-ray}/g" \
    /etc/xray/config.json.template > /etc/xray/config.json
exec xray run -config /etc/xray/config.json

#!/bin/sh
set -e
PORT="${PORT:-8080}"
UUID="${66f14545-d22a-4c5c-890f-b5afc9e1c5ea:-8080}"
WSPATH="${parsaw:-8080}"

sed -e "s/__PORT__/${PORT}/g" \
    -e "s/__UUID__/${XRAY_UUID}/g" \
    -e "s/__WSPATH__/${WS_PATH:-ray}/g" \
    /etc/xray/config.json.template > /etc/xray/config.json
exec xray run -config /etc/xray/config.json

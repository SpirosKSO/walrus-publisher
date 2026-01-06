#!/bin/bash
set -e

# Create keystore from environment variable
if [ -n "$SUI_PRIVATE_KEY_BASE64" ]; then
    echo "[\"$SUI_PRIVATE_KEY_BASE64\"]" > /root/.sui/sui_config/sui.keystore
    echo "Created keystore from environment variable"
else
    echo "WARNING: SUI_PRIVATE_KEY_BASE64 not set, using bundled keystore"
fi

mkdir -p /root/.config/walrus/publisher-wallets

exec walrus publisher \
    --bind-address "0.0.0.0:31416" \
    --sub-wallets-dir /root/.config/walrus/publisher-wallets \
    --n-clients 1
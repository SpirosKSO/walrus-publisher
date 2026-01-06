#!/bin/bash
set -e

echo "🐋 Starting Walrus Publisher for Mainnet..."

# Create sub-wallets directory for concurrency
mkdir -p /root/.config/walrus/publisher-wallets

echo "🚀 Starting publisher on port 31416..."

# Start the publisher
exec walrus publisher \
    --bind-address "0.0.0.0:31416" \
    --sub-wallets-dir /root/.config/walrus/publisher-wallets \
    --n-clients 1

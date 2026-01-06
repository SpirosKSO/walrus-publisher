#!/bin/bash
set -e

echo "🐋 Starting Walrus Publisher for Mainnet..."

# Check required environment variable
if [ -z "$SUI_PRIVATE_KEY" ]; then
    echo "❌ Error: SUI_PRIVATE_KEY environment variable is required"
    exit 1
fi

# Create wallet config from environment variable
echo "📝 Setting up wallet configuration..."
mkdir -p /root/.config/walrus

# Create the client config for mainnet
cat > /root/.config/walrus/client_config.yaml << EOF
# Walrus client configuration
system_object: 0x2f8f6d5da7f0aaf0585baa07d93c518fad809cd5f02f2c9f236cf30257732fd3
staking_object: 0xf1849bdb9fcfbc08b59a7c5e5cde8a1da7c0c97d4d3d7ae64c9a1b5a5b5c5d5e
exchange_objects:
  - 0x0e60a946a527902c90bbc71240435728cd6dc26b9e8debc69f09b71671c3029b
rpc_url: https://fullnode.mainnet.sui.io:443
EOF

# Decode and save private key for wallet
# The walrus CLI expects the key in a specific format
echo "🔑 Configuring wallet..."

# Start the publisher
echo "🚀 Starting publisher on port 31416..."
exec walrus publisher \
    --bind-address "0.0.0.0:31416" \
    --network mainnet

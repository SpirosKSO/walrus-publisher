# Walrus Publisher for Sui Mainnet
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download Walrus binary for mainnet
RUN curl -L -o /usr/local/bin/walrus \
    https://storage.googleapis.com/mysten-walrus-binaries/walrus-mainnet-latest-ubuntu-x86_64 \
    && chmod +x /usr/local/bin/walrus

# Create config directories
RUN mkdir -p /root/.config/walrus /root/.sui/sui_config

# Copy Sui wallet config
COPY client.yaml /root/.sui/sui_config/client.yaml
COPY sui.keystore /root/.sui/sui_config/sui.keystore

# Copy Walrus client config
COPY client_config.yaml /root/.config/walrus/client_config.yaml

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Set logging
ENV RUST_LOG=info

# Expose publisher port
EXPOSE 31416

CMD ["/start.sh"]

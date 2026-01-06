# Walrus Publisher for Sui Mainnet
FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download Walrus binary
RUN curl -L -o /usr/local/bin/walrus \
    https://storage.googleapis.com/mysten-walrus-binaries/walrus-latest-ubuntu-x86_64 \
    && chmod +x /usr/local/bin/walrus

# Create config directory
RUN mkdir -p /root/.config/walrus

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose publisher port
EXPOSE 31416

CMD ["/start.sh"]

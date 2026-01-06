# Walrus Publisher

Walrus Publisher service for Sui Mainnet - used by Artos e-commerce for decentralized receipt storage.

## Deployment on Railway

1. Create new project on Railway
2. Connect this GitHub repo
3. Add environment variable:
   - `SUI_PRIVATE_KEY`: Your Sui wallet private key (with WAL tokens)

4. Deploy!

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `SUI_PRIVATE_KEY` | Sui wallet private key (bech32 format: `suiprivkey1...`) | ✅ |

## Endpoints

- `PUT /v1/blobs?epochs=N` - Upload a blob
- `GET /v1/status` - Health check

## Usage

The publisher exposes port 31416. After deployment, use the Railway URL:
```
https://your-app.railway.app
```

Update your Vercel backend:
```
WALRUS_PUBLISHER_URL=https://your-app.railway.app
```

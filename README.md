# Deploy and Host Umami Analytics on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/umami)

Umami is a simple, fast, privacy-focused alternative to Google Analytics. One-click deploy on Railway with a PostgreSQL companion database.

## About Hosting

Umami provides a powerful analytics platform with:

- Real-time data and dashboard
- Unlimited websites and events
- Multiple language support
- Tracking code for websites
- REST API for data access
- PostgreSQL backend for reliability
- Docker-based deployment on any platform

Deploying on Railway means you get automatic HTTPS, persistent storage, and continuous updates.

## Why Deploy Umami

Umami is one of the most popular open-source analytics solutions because it offers:

- Zero cost — completely free and open source (MIT)
- Privacy focused — no cookies, GDPR compliant
- Lightweight — minimal impact on page load times
- Real-time analytics — see visitors as they browse
- Unlimited data — no artificial caps on events or sites
- Self-hosted — full control over your data

## Common Use Cases

1. Website Analytics — track visitors, page views, events without Google
2. Privacy Compliance — GDPR-friendly analytics that doesn't require cookie banners
3. Multiple Sites — manage analytics for many websites from one dashboard
4. Open Source Projects — self-hosted analytics for your projects

## Dependencies for Umami

### Deployment Dependencies

The template deploys two services:

| Service | Path | Description |
|---------|------|-------------|
| `umami` | `Dockerfile` | Analytics web app on port 3000 (`ghcr.io/umami-software/umami:postgresql-latest`) |
| `postgres` | `postgres/Dockerfile` | PostgreSQL 16 (Alpine) sibling with persistent volume at `/var/lib/postgresql` (PGDATA=`/var/lib/postgresql/data`) |

The Railway dashboard creates both services automatically when this template deploys. No external database or third-party service is required.

## Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| DATABASE_URL | PostgreSQL connection string | `postgresql://postgres:postgres@postgres.railway.internal:5432/umami` | Yes |
| HASH_SALT | Secret salt for hashing (auto-generated) | `${{secret(32)}}` | Yes |
| PORT | Port Umami listens on | `3000` | No |

## Getting Started

After deployment:

1. Wait for both services to become healthy
2. Access your Umami instance via the generated public URL
3. Log in with the default credentials — username `admin`, password `umami`
4. Change the default password immediately via Settings > Profile > Password

> **Note:** The initial admin credentials (`admin` / `umami`) are seeded during the database migration and cannot be customized via environment variables. You must change the password through the UI or the `/api/me/password` endpoint after first login.

## License

Umami is licensed under the MIT License.

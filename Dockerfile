# =============================================================================
# Dockerfile: Umami Analytics on Railway – PostgreSQL backend
# Docker image source: https://ghcr.io/umami-software/umami
# Project:          https://github.com/umami-software/umami
# License:          MIT
# =============================================================================

FROM ghcr.io/umami-software/umami:postgresql-latest

ARG BUILD_YEAR=2026

LABEL org.opencontainers.image.title="Umami Analytics" \
      org.opencontainers.image.description="A simple, fast, privacy-focused alternative to Google Analytics." \
      org.opencontainers.image.source="https://github.com/umami-software/umami" \
      org.opencontainers.image.vendor="Umami Software" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.created="${BUILD_YEAR}-07-16T00:00:00Z"

ENV PORT=3000

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=5 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/api/heartbeat || exit 1

EXPOSE 3000

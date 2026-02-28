FROM node:20-alpine

# Create non-root user
RUN addgroup -S app && adduser -S -G app app

WORKDIR /app
COPY . .

# Use non-root user
USER app:app

# Minimal healthcheck (verifies container fs is accessible and Node runs)
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD node -e "process.exit(require('fs').existsSync('/app')?0:1)"

CMD ["node", "-e", "console.log('ok')"]

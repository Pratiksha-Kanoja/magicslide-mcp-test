# --- Dependencies + Build stage ---
FROM node:20-alpine AS builder
WORKDIR /app

# Install deps first for better layer caching
COPY package*.json ./
RUN npm ci

# Copy source and build
COPY tsconfig.json ./
COPY src ./src
RUN npm run build  # expects: tsc -> outputs to /app/build

# --- Production runtime stage ---
FROM node:20-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production

# Copy only what's needed to run
COPY package*.json ./
RUN npm ci --omit=dev

# Bring in compiled JS from builder
COPY --from=builder /app/build ./build

# If you need any runtime assets (views, public, etc), copy them here
# COPY public ./public

# Healthcheck (optional)
# HEALTHCHECK --interval=30s --timeout=3s \
#   CMD node -e "process.exit(0)"

EXPOSE 3000
CMD ["node", "build/index.js"]

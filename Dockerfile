FROM node:20-slim

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies only (no build yet since source files aren't copied)
RUN npm ci

# Copy source code
COPY . .

# Build TypeScript to build/index.js
# Smithery will use the default export from this file
RUN npm run build

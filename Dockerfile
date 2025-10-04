# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better Docker layer caching
COPY package*.json ./

# Install all dependencies (including dev dependencies for TypeScript build)
RUN npm ci

# Copy TypeScript config and source code
COPY tsconfig.json ./
COPY src ./src

# Build the TypeScript code
RUN npm run build

# Verify build output exists and is executable
RUN ls -la build/ && test -f build/index.js && chmod +x build/index.js

# Remove dev dependencies to reduce image size
RUN npm prune --omit=dev

# Start the MCP server
CMD ["node", "build/index.js"] 
FROM node:20-slim

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies only (no build yet since source files aren't copied)
RUN npm ci

# Copy source code
COPY . .

# Now build TypeScript to build/index.js
RUN npm run build

# Smithery runtime will load this via the default export
CMD ["node", "build/index.js"]

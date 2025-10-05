FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Build the TypeScript application
RUN npm run build

# Build with Smithery CLI
RUN npx -y @smithery/cli build -o .smithery/index.cjs

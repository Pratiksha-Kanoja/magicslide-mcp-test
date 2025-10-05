FROM node:20-alpine

WORKDIR /app

# Copy only manifest first for better caching
COPY package*.json ./

# Install deps (keep dev deps because we build in this image)
RUN npm ci

# Copy the rest
COPY . .

# Build TS
RUN npm run build

# Build Smithery bundle (use Option A or B)
# Option A (explicit entry):
# RUN npx -y @smithery/cli build ./src/index.ts -o .smithery/index.cjs
# Option B (package.json "module" field):
RUN npx -y @smithery/cli build -o .smithery/index.cjs

CMD ["node", ".smithery/index.cjs"]

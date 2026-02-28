# Simple Node runtime for the kit
FROM node:20-alpine AS base
WORKDIR /app
COPY package.json package-lock.json* tsconfig.json .eslintrc.json ./
RUN npm ci || npm i --no-audit --no-fund
COPY src ./src
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=base /app/dist ./dist
CMD ["node", "dist/index.js"]

FROM node:current-alpine

WORKDIR /app

RUN adduser -D nodeuser && \
    npm install -g pnpm && \
    chown -R nodeuser:nodeuser /app && \
    chmod -R 755 /app

USER nodeuser

COPY package*.json ./
COPY pnpm-lock.yaml ./

EXPOSE 3000
EXPOSE 6006

RUN pnpm install

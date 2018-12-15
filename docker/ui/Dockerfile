# BUILD Stage
FROM node:10.14.2 AS builder

WORKDIR /app

COPY ui/package.json ui/yarn.lock /app/
RUN yarn

COPY ui /app

RUN yarn build

# DIST Stage
FROM vizv/nginx:latest

COPY docker/ui/configs /etc/nginx
COPY --from=builder /app/dist /var/www

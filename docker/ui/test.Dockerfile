FROM node:10.14.2

RUN apt-get update \
 && apt-get install -y openjdk-8-jre-headless chromium \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ui/package.json ui/yarn.lock /app/
RUN yarn

COPY ui /app

COPY docker/ui/e2e.sh /

CMD ["/e2e.sh"]

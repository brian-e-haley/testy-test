FROM node:12.16-slim as builder
COPY . /app/
WORKDIR /app
RUN \
    yarn install --frozen-lockfile \
    && yarn build \
    && yarn cache clean

FROM node:12.16-slim
COPY server.js /app/
COPY --from=builder /app/build/ /app/build/
WORKDIR /app
RUN \
    yarn add global express@4.17.0 \
    && yarn add global ejs@3.1.6
CMD node server.js

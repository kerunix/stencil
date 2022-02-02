FROM node:14.17.0-alpine AS base

WORKDIR /usr/src/app
COPY package*.json ./
COPY yarn.lock ./
RUN yarn
COPY . .

FROM base AS dev
ENV NODE_ENV=development
RUN "node ace migration:run"
CMD ["node", "ace", "serve", "--watch"]
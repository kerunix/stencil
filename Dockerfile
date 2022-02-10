FROM node:14.17.0-alpine AS base

WORKDIR /usr/src/app
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY . .

FROM base AS dev
ENV CHOKIDAR_USEPOLLING=true
ENV NODE_ENV=development
CMD ["node", "ace", "serve", "--watch"]
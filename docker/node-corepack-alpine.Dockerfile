ARG NODE_VERSION=20-alpine
FROM node:${NODE_VERSION}

WORKDIR /app

ARG PNPM_VERSION=latest
RUN corepack enable && \
  corepack prepare pnpm@${PNPM_VERSION} --activate

ARG NPM_VERSION=latest
RUN npm install -g npm@${NPM_VERSION}

ENV PNPM_HOME=/usr/local/pnpm
ENV PATH="${PNPM_HOME}/bin:${PATH}"
RUN pnpm config set global-bin-dir ${PNPM_HOME}/bin

ARG PNPM_REGISTRY=https://registry.npmjs.org
RUN pnpm config set registry ${PNPM_REGISTRY}

RUN apk add --no-cache libc6-compat
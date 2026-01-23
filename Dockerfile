FROM node:18-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml* pnpm-workspace.yaml ./

RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile --recursive

RUN pnpm --filter @trylinky/frontend build:frontend

COPY . .

EXPOSE 3000

CMD ["pnpm", "start"]

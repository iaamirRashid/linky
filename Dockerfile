FROM node:20-bookworm-slim

WORKDIR /app

# copy full repo
COPY . .

# install pnpm
RUN npm install -g pnpm

# install deps
RUN pnpm install --frozen-lockfile

# prisma generate (VERY IMPORTANT)
RUN npx prisma generate --schema=packages/prisma/prisma/schema.prisma

# build frontend
RUN pnpm --filter @trylinky/frontend build:frontend

EXPOSE 3000

CMD ["pnpm", "--filter", "@trylinky/frontend", "start:frontend"]

FROM node:20-alpine

WORKDIR /app

# 1️⃣ copy full repo
COPY . .

# 2️⃣ install pnpm + deps
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

# 3️⃣ prisma generate (DIRECT CLI)
RUN npx prisma generate --schema=packages/prisma/prisma/schema.prisma

# 4️⃣ build frontend
RUN pnpm --filter @trylinky/frontend build:frontend

# 5️⃣ expose port
EXPOSE 3000

# 6️⃣ start frontend
CMD ["pnpm", "--filter", "@trylinky/frontend", "start:frontend"]

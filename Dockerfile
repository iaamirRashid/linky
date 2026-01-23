FROM node:20-alpine

WORKDIR /app

# 1️⃣ poora monorepo copy
COPY . .

# 2️⃣ pnpm install (workspace support)
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

# 3️⃣ frontend build
RUN pnpm --filter @trylinky/frontend build:frontend

# 4️⃣ expose port
EXPOSE 3000

# 5️⃣ start frontend only
CMD ["pnpm", "--filter", "@trylinky/frontend", "start:frontend"]

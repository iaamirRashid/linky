FROM node:18-alpine

WORKDIR /app

# 1️⃣ Pehle poora monorepo copy karo
COPY . .

# 2️⃣ pnpm install (ab workspace detect hoga)
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

# 3️⃣ frontend build
RUN pnpm --filter @trylinky/frontend build:frontend

EXPOSE 3000

# 4️⃣ sirf frontend start
CMD ["pnpm", "--filter", "@trylinky/frontend", "start:frontend"]

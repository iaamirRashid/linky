FROM node:18-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./

RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile --recursive

COPY . .

EXPOSE 3000

CMD ["pnpm", "start"]

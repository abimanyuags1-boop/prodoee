FROM node:22-alpine AS build
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm ci
COPY backend/tsconfig.json ./
COPY backend/src ./src
RUN npm run build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci
COPY frontend ./
RUN npm run build
FROM node:22-alpine
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm ci --omit=dev
COPY --from=build /app/backend/dist ./dist
COPY --from=build /app/frontend/dist ../frontend/dist
EXPOSE 4000
CMD ["npm", "start"]
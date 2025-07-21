# Build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Runtime stage
FROM nginx:alpine
COPY --from=build /app/dist/admin-angular /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 4200
CMD ["nginx", "-g", "daemon off;"]
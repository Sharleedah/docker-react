# Purpose: Install Dependencies + Setup Application
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

#Pro Block nur ein FROM - Statement
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

FROM node:13-alpine

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# prod. environment as different BLOCK; starts from `FROM`
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


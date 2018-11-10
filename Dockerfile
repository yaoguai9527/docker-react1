FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN ["npm", "config", "set", "registry", "http://registry.npm.taobao.org"]
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
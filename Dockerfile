FROM node:18-bullseye-slim AS build

WORKDIR /app

EXPOSE 5173

COPY package.json yarn.lock ./

RUN yarn 

COPY . .

RUN yarn build



FROM  nginx:stable-alpine-slim

COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]



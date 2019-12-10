FROM node:10.15-alpine as build
WORKDIR /app

COPY package.json .
RUN npm install


FROM node:10.15-alpine
WORKDIR /app

RUN apk add --no-cache curl tzdata && \
  ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo "Asia/Shanghai" > /etc/timezone && \
  rm -rf /var/cache/apk/*

COPY --from=build /app/node_modules ./node_modules
COPY package.json .
COPY index.js .
CMD npm start

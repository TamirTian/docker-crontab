FROM node:10.15-alpine as build
WORKDIR /app

COPY package.json .
RUN npm install


FROM node:10.15-alpine
COPY repositories /etc/apk/repositories
RUN apk add --no-cache curl
WORKDIR /app

COPY --from=build /app/node_modules ./node_modules
COPY package.json .
COPY index.js .
CMD npm start

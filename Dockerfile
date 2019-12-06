FROM node:10.15-alpine as build
WORKDIR /app

COPY package.json .
RUN npm install


FROM node:10.15-alpine
WORKDIR /app

RUN apk add --no-cache curl

COPY --from=build /app/node_modules ./node_modules
COPY package.json .
COPY index.js .
CMD npm start

FROM node:16 as build
WORKDIR /usr/src/app
COPY package.json server.js ./
RUN npm install

FROM node:alpine as main
COPY --from=build /usr/src/app /
EXPOSE 3000
CMD [ "node", "server.js" ]

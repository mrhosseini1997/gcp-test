FROM node:10.15.1-alpine as builder

WORKDIR /opt/src

COPY /application/package.json .
COPY /application/package-lock.json .
RUN npm install

FROM node:10.15.1-alpine as runner

WORKDIR /opt/run

COPY --from=builder /opt/src/node_modules ./node_modules
COPY /application/* .

CMD ["npm", "run", "start:dev"]
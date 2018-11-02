FROM node:alpine

COPY ./node-todo /app/node-todo
WORKDIR /app/node-todo

RUN npm install

ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

ENTRYPOINT ["node", "server.js"]
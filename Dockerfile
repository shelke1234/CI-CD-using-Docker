FROM node:latest
WORKDIR /usr/src/app
COPY manifests/* /
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]

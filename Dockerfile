# using nodejs v14 as base
FROM node:14-alpine as base
# set working directory in container
WORKDIR /src
# copy all files & folders to local workdir to container workdir
COPY . .
# do clean install depedencies
RUN npm ci
# expose port for comunication
EXPOSE 3001
# run nodejs
CMD ["npm", "start"]

# re-use base
FROM base as dev
RUN apk add --no-cache bash
# get it for waiting rabbitmq initialization
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# make it executable
RUN chmod +x /bin/wait-for-it.sh
# using nodejs v14
FROM node:14-alpine

# set working directory in container
WORKDIR /app

# copy all files & folders to local workdir to container workdir
COPY . .

# set environment
ENV NODE_ENV=production DB_HOST=item-db

# build depedencies
RUN npm install --production --unsafe-perm && npm run build

# expose port for comunication
EXPOSE 8080

# run nodejs
CMD ["npm", "start"]
# build environment
FROM node:16.13.1 as build

## Build & pack app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
RUN npm install typescript -g
COPY . /app
RUN npm run build

## Bundle static files
FROM ubuntu:20.04
WORKDIR /app
COPY --from=build /app/.env /app
COPY --from=build /app/build /app/build
COPY --from=build /app/node_modules /app/node_modules

# Then run: (don't forget to git pull at root dir)
# $ docker build -f dockerfile -t api-alan-codes:prod .
# $ docker run -d --name api-alan-codes-01 -it -p 8080:8080 --rm api-alan-codes:prod

# Note: if fresh install, be sure to add the .env file with following template
#AWSAccessKeyId=<bucket key - it is in LastPass>
#AWSSecretKey=<bucket secret - it is in LastPass>
#Bucket=<bucket name>
#MongoUser=<username>
#MongoPass=<password>
#MongoIP=<server host>
#CorsOrigin=<domain/ip of alan.codes>
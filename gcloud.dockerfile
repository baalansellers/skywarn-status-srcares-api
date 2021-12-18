## Build Environment
FROM us.gcr.io/sylvan-octagon-268211/skywarn-status-srcares-api-static:latest AS build

## Host Environment
FROM node:16.13.1-buster
WORKDIR /app
RUN npm install pm2 -g
COPY --from=build /app /app

EXPOSE 8080
CMD ["pm2-runtime", "build/server.js"]
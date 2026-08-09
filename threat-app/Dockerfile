#Build stage: uses alpine image to create application as builder
FROM node:25-alpine AS builder 

#set working directory for app 
WORKDIR /app 

#copies the dependency files into current working directory 
COPY package.json yarn.lock ./

#installs dependencies 
RUN yarn install 

#copies remaining source code files into container 
COPY . .

#creates production build of app 
RUN yarn build 

#---runtime---

#smaller image only contains what is required to run the app
FROM node:25-alpine AS runtime

#sets working directory for the app
WORKDIR /app 

#copy build folder (final build artifacts required to execute application) from builder stage into the build folder in runtime stage 
COPY --from=builder /app/build /app/build 

#copy our actual server file from the builder stage
#(this is the file that runs the app and answers /health)
COPY --from=builder /app/server.js ./

#creates group called appgroup, creates user called appuser and adds to appgroup 
RUN addgroup -S appgroup && adduser -S appuser -G appgroup 

#changes owndership and gives read/run permision to appuser in appgroup for /app
RUN chown -R appuser:appgroup /app 

#switches to appuser 
USER appuser 

#tell Docker to automatically check, every 30 seconds, whether the app is still alive
#by requesting /health and expecting a successful response
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

#document which port the app listens on inside the container
EXPOSE 3000

#starts the web server, enables single page application mode and serves files from the build folder
CMD ["node", "server.js"]

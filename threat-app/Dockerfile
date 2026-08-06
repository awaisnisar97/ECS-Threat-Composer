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

#copies installed dependencies (including express) from builder stage into runtime stage
COPY --from=builder /app/node_modules /app/node_modules

#installs the serve package globally, making the 'serve' command available to run the react production build as a web server 
RUN yarn global add serve 

EXPOSE 3000

#starts the web server, enables single page application mode and serves files from the build folder
CMD ["serve", "-s" "build"]

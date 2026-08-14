# STAGE 1: BUILD THE REACT APPLICATION

# Use Node.js only for building the React application.
# Node is NOT included in the final production image.
FROM node:22-alpine AS builder

# Create and move into the application directory.
WORKDIR /app

# Copy the dependency files first.
# package.json tells Yarn what dependencies are required.
# yarn.lock records the exact dependency versions.
COPY package.json yarn.lock ./

# Install all dependencies required to build the application.
RUN yarn install

# Now copy the application source code.
COPY . .

# Build the React application for production.
# This creates the production files inside /app/build.
RUN yarn build

# STAGE 2: PRODUCTION RUNTIME

# # Use Nginx (non root by default) as the production web server, no Node.js in this final image
FROM nginxinc/nginx-unprivileged:stable-alpine AS runtime

# Copy the finished React build from the builder stage into nginx's default folder for serving files
COPY --from=builder /app/build /usr/share/nginx/html

# Copy our custom Nginx config which sets up health route and serves react app, replaces nginx default config which gets renamed to default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# The unprivileged Nginx image listens on port 8080.
EXPOSE 8080

# Docker running nginx, passes config file directly on command line instead of writing it in config file and keeps it running in foregorund (daemon off) 
CMD ["nginx", "-g", "daemon off;"]
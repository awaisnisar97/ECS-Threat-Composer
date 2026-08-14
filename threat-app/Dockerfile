# STAGE 1: BUILD THE REACT APPLICATION
# ============================================================

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
# ============================================================

# Use Nginx as the production web server.
# This image is designed to run Nginx without root privileges.
# Node.js is NOT present in this final image.
FROM nginxinc/nginx-unprivileged:stable-alpine AS runtime

# Copy ONLY the production React build from the builder stage.
# We don't need the source code or Node dependencies anymore.
COPY --from=builder /app/build /usr/share/nginx/html

# Copy our custom Nginx configuration.
# This configuration provides:
#   - /health endpoint
#   - React SPA route fallback
COPY nginx.conf /etc/nginx/conf.d/default.conf

# The unprivileged Nginx image listens on port 8080.
EXPOSE 8080

# Run Nginx in the foreground.
# Docker needs the main process to remain running.
CMD ["nginx", "-g", "daemon off;"]
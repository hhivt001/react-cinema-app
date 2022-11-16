# Set base image.
FROM node:19-alpine

# Set working directory.
WORKDIR /app

# Copy files from current directory to working directory.
COPY . /app

# Install dependencies. Can use RUN npm ci if there is a package-lock.json, but we are using yarn rather than npm, so we must use RUN npm install.
RUN npm install

# Build production app
RUN npm run build

# Listen on specified port(s)
EXPOSE 3000

# Set node server
ENTRYPOINT npm run start
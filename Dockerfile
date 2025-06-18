# Use an official Node.js runtime as the base image
FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy application files
COPY main.js .

# Run the app
CMD ["node", "main.js"]

# Use an official Node.js runtime as a base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the entire project into the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Command to start the application
CMD ["node", "app.js"]

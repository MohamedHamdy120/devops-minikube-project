# 1) Base image: this simulates choosing the runtime in the cloud image
FROM node:lts-alpine

# 2) Set working directory inside the container
WORKDIR /usr/src/app

# 3) Copy only package files first (better for caching in CI)
COPY package*.json ./

# 4) Install dependencies
RUN npm install --only=production

# 5) Copy the rest of the application code
COPY . .

# 6) Expose the port the app listens on (for documentation/Kubernetes)
EXPOSE 3000

# 7) Default command: how the app is started inside the container
CMD ["npm", "start"]

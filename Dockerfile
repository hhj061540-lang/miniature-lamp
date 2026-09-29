# Use an official lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Install wget to fetch files from GitHub
RUN apk add --no-cache wget

# Download server.js directly from your GitHub repository
RUN wget https://raw.githubusercontent.com/hhj061540-lang/miniature-lamp/refs/heads/main/server.js -O server.js

# Initialize a package.json and install dependencies (express and cors)
RUN npm init -y && \
    npm install express cors

# Expose the default port (Render uses PORT environment variable dynamically)
EXPOSE 3000

# Set environment variable (can be overridden by Render)
ENV PORT=3000

# Start the application
CMD ["node", "server.js"]

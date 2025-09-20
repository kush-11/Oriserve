FROM node:18-alpine
WORKDIR /app

RUN npm install --production
CMD ["node", "src/index.js"]
EXPOSE 3000

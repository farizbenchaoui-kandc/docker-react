#build phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
#copy built files to nginx directory
COPY --from=builder /app/build /usr/share/nginx/html

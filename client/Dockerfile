FROM node:16-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#which ports are intended to be published. For AWS Elastic Beanstalk
#To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html

FROM nginx:stable-alpine-slim

WORKDIR /usr/share/nginx/html

COPY app/index.html .

EXPOSE 80

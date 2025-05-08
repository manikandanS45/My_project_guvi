FROM nginx:alpine

RUN apt upgrade

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
FROM nginx 

RUN apt update && apt install curl -y

RUN curl -s https://deb.nodesource.com/setup_18.x | bash

RUN apt install nodejs -y 

COPY . /tmp/app

WORKDIR /tmp/app  

RUN npm i

RUN npm run build 

RUN cp -r build/* /usr/share/nginx/html

EXPOSE 80
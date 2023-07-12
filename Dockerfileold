FROM node:20.4.0-buster
WORKDIR /home/app/frontend/
COPY frontend/helloworld/package.json /home/app/frontend/package.json
RUN npm install
RUN npm install -g @angular/cli
COPY frontend/helloworld/ .
CMD ng serve --host 0.0.0.0

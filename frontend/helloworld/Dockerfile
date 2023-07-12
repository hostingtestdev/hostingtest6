FROM node:20.4.0-buster
WORKDIR /home/app/frontend/
COPY package.json /home/app/frontend/package.json
RUN npm install
RUN npm install -g @angular/cli
COPY . /home/app/frontend/
CMD ng serve --host 0.0.0.0

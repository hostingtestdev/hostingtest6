FROM node:20.4.0-buster
WORKDIR /home/app/frontend/
COPY frontend/helloworld/package.json /home/app/frontend/package.json
RUN npm install
RUN npm install -g @angular/cli
COPY frontend/helloworld/ .
RUN npm run build --prod
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html

EXPOSE 4200
CMD ["npm", "start"]
CMD ng serve --host 0.0.0.0 --disable-host-check

#FROM node:20.4.0-buster as angular-build
#WORKDIR /app
#COPY frontend/helloworld/package.json frontend/helloworld/package-lock.json ./
#RUN npm install
#COPY frontend/helloworld/ .
#RUN npm run build

#FROM maven:3.8.3-openjdk-17 AS spring-build
#WORKDIR /app
#COPY backend/helloworld/pom.xml .
#RUN mvn pom.xml clean package
#COPY backend/helloworld/src ./src

#COPY --from=build /app/target/helloworld-0.0.1-SNAPSHOT.jar /app/helloworld-0.0.1-SNAPSHOT.jar
#COPY --from=angular-build /app/dist/frontend /app/frontend
#WORKDIR /app
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/local/lib/helloworld-0.0.1-SNAPSHOT.jar"]

#FROM node:20.4.0-buster
#WORKDIR /app
#COPY frontend/helloworld/package.json ./
#RUN npm install
#COPY frontend/helloworld/ .
#RUN npm run build --prod

#FROM nginx:alpine
#COPY --from=angular-build /app/dist/frontend /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]

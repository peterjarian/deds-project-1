FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=deds
ENV MYSQL_USER=deds
ENV MYSQL_PASSWORD=deds
ENV MYSQL_DATABASE=deds

COPY ./docker/staging-area/init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306

FROM postgres:latest

ENV POSTGRES_USER=deds
ENV POSTGRES_PASSWORD=deds

COPY ./docker/staging-area/init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
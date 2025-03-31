FROM postgres:latest

ENV POSTGRES_USER=deds
ENV POSTGRES_PASSWORD=deds

COPY ./docker/staging-area/init.pgsql /docker-entrypoint-initdb.d/init.sql

EXPOSE 5432
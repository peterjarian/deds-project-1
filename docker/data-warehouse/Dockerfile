FROM postgres:latest

ENV POSTGRES_USER=deds
ENV POSTGRES_PASSWORD=deds

COPY ./docker/data-warehouse/init.sql /docker-entrypoint-initdb.d/

EXPOSE 5433
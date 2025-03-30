FROM mcr.microsoft.com/mssql/server:2017-latest
USER root

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=P@ssw0rd123!

RUN mkdir -p /usr/config
WORKDIR /usr/config

COPY ./data/northwind.sql /usr/config/
COPY ./docker/northwind/entrypoint.sh /usr/config/
COPY ./docker/northwind/init.sh /usr/config/

RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/init.sh

EXPOSE 1433

ENTRYPOINT ["/usr/config/entrypoint.sh"]
FROM postgres:12.3-alpine
COPY ./backup/bd.backup /tmp
COPY ./backup/initialize.sh /docker-entrypoint-initdb.d/initialize.sh
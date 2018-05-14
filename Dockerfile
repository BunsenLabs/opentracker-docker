FROM fedora:latest
RUN dnf install -y  opentracker-ipv4 opentracker-ipv6 supervisor
WORKDIR /service/
ADD service/ ./
EXPOSE 6969
ENTRYPOINT [ "/usr/bin/supervisord", "--nodaemon", "--configuration=/service/supervisord.conf" ]

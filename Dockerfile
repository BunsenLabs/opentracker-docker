FROM fedora:latest
RUN dnf install -y opentracker-ipv4 opentracker-ipv6 supervisor
COPY service /
ENTRYPOINT [ "/usr/bin/supervisord", "--nodaemon", "--user=nobody", "--configuration=/service/supervisord.conf" ]

FROM fedora:latest
RUN dnf install opentracker-ipv4 opentracker-ipv6 supervisord
COPY service /
ENTRYPOINT [ "/usr/bin/supervisord", "--nodaemon", "--user=nobody", "--configuration=/service/supervisord.conf" ]

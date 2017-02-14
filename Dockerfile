FROM ubuntu:trusty
RUN apt-get update && apt-get install -y djbdns wget

ADD update-data.sh /etc/service/update-data/run
ADD tinydns-run.sh /etc/service/tinydns/run
ADD axfrdns-run.sh /etc/service/axfrdns/run

ENV ROOT="/etc/tinydns" IP="0.0.0.0" UID="0" GID="0" AXFR="none" CHECK_DELAY="30"
RUN mkdir -p $ROOT

EXPOSE 53
EXPOSE 53/udp

CMD ["svscan", "/etc/service"]

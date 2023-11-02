FROM alpine

RUN apk --update --no-cache add \
    tinyproxy

RUN sed -i -e '/^Allow /s/^/#/' \
    -e '/^ConnectPort /s/^/#/' \
    -e '/^#DisableViaHeader /s/^#//' \
    /etc/tinyproxy/tinyproxy.conf

VOLUME /etc/tinyproxy
EXPOSE 8888

CMD ["/usr/bin/tinyproxy", "-d"]
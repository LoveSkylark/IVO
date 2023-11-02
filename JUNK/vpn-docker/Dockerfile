FROM alpine:latest
LABEL Maintainer = Skylark 

RUN apk --update --no-cache add \
    busybox-extras \
    acl \
    bash \
    bind-tools \
    binutils \
    ca-certificates \
    coreutils \
    curl \
    file \
    fping \
    ipmitool \
    iputils \
    mtr \
    nmap \
    openssl \
    openssh-client \
    perl \
    python3 \
    py3-pip \
    runit \
    shadow \
    ttf-dejavu \
    tzdata \
    util-linux \
    whois

RUN apk --update --no-cache add \
    gnome-keyring \
    xvfb \
    tzdata \
    openconnect

# RUN apk --update --no-cache add -t build-dependencies \
RUN apk --update --no-cache add \
    build-base \
    make \
    musl-dev \
    python3-dev \
    py3-qt5 \
    qt5-qtwebengine \
    py3-qtwebengine
#  && pip3 install --upgrade pip openconnect-sso
# && apk del build-dependencies 

# RUN setcap cap_net_raw+ep /usr/bin/nmap
 
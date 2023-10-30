FROM alpine:latest
LABEL Maintainer = Skylark 

RUN apk --update --no-cache add \
    openconnect \
    python3 \
    py3-pip

# RUN apk --update --no-cache add -t build-dependencies \
#     build-base \
#     linux-headers \
#     musl-dev \
#     make \
#     python3-dev

# RUN pip3 install --upgrade pip

RUN apk --update --no-cache add \
    build-base \
    make \
    musl-dev \
    python3-dev \
    py3-qt5 \
    qt5-qtwebengine \
    py3-qtwebengine \
 && pip3 install --upgrade pip openconnect-sso


-file



# #swithc to USER
# ARG user=vpn
# RUN adduser -D $user \
#   && mkdir -p /etc/sudoers.d \
#   && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user \
#   && echo "$user:$user" | chpasswd
# USER $user
# WORKDIR /home/$user

# #RUN apk del build-dependencies

# RUN pip3 install --upgrade pip \

  



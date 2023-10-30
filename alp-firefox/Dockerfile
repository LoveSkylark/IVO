FROM alpine

ENV DISPLAY=host.docker.internal:0.0


# Browser setup
RUN apk add --no-cache firefox-esr \
    ttf-dejavu \
    ttf-liberation

# Open Connect Setup
RUN apk --update --no-cache add \
    openconnect \
    python3 \
    py3-pip
    
RUN apk --update --no-cache add \
    build-base \
    make \
    musl-dev \
    python3-dev \
    py3-qt5 \
    py3-qtwebengine

# RUN apk --update --no-cache add qt6-qtbase-x11
# RUN apk --update --no-cache add py3-pyqt5-sip
# RUN apk --update --no-cache add py3-sip
#  #&& pip3 install --upgrade pip openconnect-sso[full]==0.7.3

# create user
ARG USER=vpn
RUN adduser -D $USER




USER $USER

# CMD firefox-esr --no-sandbox --in-process-gpu
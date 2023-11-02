FROM alpine

ENV DISPLAY=host.docker.internal:0.0
ENV NGINX_VERSION=nginx-1.18.0
ENV NGINX_PATCH=proxy_connect_rewrite_102101.patch

# Browser setup
RUN apk --update --no-cache add \
    linux-headers \
    git \
    build-base \
    curl \
    patch \
    pcre-dev \
    zlib-dev \
    openssl-dev \
    make \
    sudo \
    busybox

RUN apk add --no-cache busybox
# WORKDIR /tmp

# RUN curl -L https://nginx.org/download/${NGINX_VERSION}.tar.gz | tar xz \
#   && cd ${NGINX_VERSION} \
#   && git clone https://github.com/dannote/socks-nginx-module.git \
#   && ./configure --add-module=socks-nginx-module
# RUN make && make install
#   # && cd ..
#   # && rm -rf ${NGINX_VERSION} ngx_http_proxy_connect_module-master

# # COPY default.conf /etc/nginx/http.d/default.conf 
# # COPY nginx.conf /usr/local/nginx/conf/nginx.conf 

# EXPOSE 8080
# EXPOSE 4443

#CMD ["nginx", "-g", "daemon off;"]
#/usr/local/nginx/sbin/nginx
#openssl req -x509 -newkey rsa:4096 -sha256 -days 365-nodes -keyout server.key -out server.crt
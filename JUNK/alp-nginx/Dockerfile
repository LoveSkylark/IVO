FROM alpine

ENV DISPLAY=host.docker.internal:0.0
ENV NGINX_VERSION=nginx-1.25.3
ENV NGINX_PATCH=proxy_connect_rewrite_102101.patch

# Browser setup
RUN apk --update --no-cache add \
    linux-headers \
    nginx \
    git \
    build-base \
    curl \
    patch \
    pcre-dev \
    zlib-dev \
    openssl-dev \
    make \
    sudo

WORKDIR /tmp

RUN curl -L https://nginx.org/download/${NGINX_VERSION}.tar.gz | tar xz \
  && curl -L https://github.com/chobits/ngx_http_proxy_connect_module/archive/master.tar.gz | tar xz \
  && cd ${NGINX_VERSION} \
  && patch -p1 < ../ngx_http_proxy_connect_module-master/patch/${NGINX_PATCH} \
  && ./configure --add-module=../ngx_http_proxy_connect_module-master --with-http_ssl_module \
  && make \
  && make install \
  && cd .. \
  && rm -rf ${NGINX_VERSION} ngx_http_proxy_connect_module-master

COPY default.conf /etc/nginx/http.d/default.conf 
#COPY nginx.conf /usr/local/nginx/conf/nginx.conf 

EXPOSE 8080
EXPOSE 4443

#CMD ["nginx", "-g", "daemon off;"]
#/usr/local/nginx/sbin/nginx
#openssl req -x509 -newkey rsa:4096 -sha256 -days 365-nodes -keyout server.key -out server.crt
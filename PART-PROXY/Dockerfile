#Dockerfile
FROM archlinux/archlinux:latest

LABEL Maintainer = LoveSkylark 

RUN pacman -Syu --needed --noconfirm \
    nginx

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 2222
EXPOSE 2323
EXPOSE 8080
EXPOSE 4443 

ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
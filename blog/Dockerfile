FROM nginx:stable-alpine

LABEL image="frank30941/myblog"
LABEL maintainer="frank30941 <frank30941@gmail.com>"
LABEL github="https://github.com/frank30941"
LABEL registry="https://hub.docker.com/u/frank30941"

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./run /root/run

RUN chmod +x /root/run; \
  mkdir -p /config/workspace/;

WORKDIR /config/workspace/

EXPOSE 80

ENTRYPOINT ["/bin/sh", "/root/run"]
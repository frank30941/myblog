FROM nginx:stable-alpine

LABEL image="frank30941/myblog"
LABEL maintainer="frank30941 <frank30941@gmail.com>"
LABEL github="https://github.com/frank30941"
LABEL registry="https://hub.docker.com/u/frank30941"

ENV HUGO_RELEASE=""
ENV HUGO_VERSION=""
ENV HOME="/config"
ENV USER=abc
ENV UID=1001
ENV GID=1001

RUN addgroup --gid "$GID" "$USER" && \
    adduser \
    --disabled-password \
    --gecos "" \
    --home "$HOME" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"; \
    mkdir -p /config/workspace/blog && \
    chown -R abc:abc "$HOME" && \
    chown -R abc:abc /config && \
    ln -s /config/workspace/blog /usr/share/nginx/html/;

RUN set -ex; \
    apk add --no-cache \
    curl \
    tar \
    git \
    build-base \
    libc6-compat

RUN HUGO_RELEASE=$(curl -sX GET "https://api.github.com/repos/gohugoio/hugo/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    HUGO_VERSION=$(echo "$HUGO_RELEASE" | awk '{print substr($1,2); }') && \
    mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz && \
    mv hugo /usr/local/bin/hugo && \
    chown root:abc /usr/local/bin/hugo;


COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /config/workspace/blog

EXPOSE 80
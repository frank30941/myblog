FROM nginx:stable-alpine

ARG CODEUSER

LABEL image="$CODEUSER/code-server"
LABEL maintainer="$CODEUSER <frank30941@gmail.com>"
LABEL github="https://github.com/$CODEUSER"
LABEL registry="https://hub.docker.com/u/$CODEUSER"

ARG CODEUSER
ARG BLOGNAME=myblog
ARG HUGO_VERSION=0.70.0
ARG GITTHEMEURL=https://github.com/bake/solar-theme-hugo.git
ARG THEME=solar-theme-hugo

ENV CODEUSER=${CODEUSER}
ENV HUGO_VERSION=${HUGO_VERSION}
ENV GITTHEMEURL=${GITTHEMEURL}
ENV THEME=${THEME}

RUN set -ex; \
    apk add --no-cache \
    curl \
    tar \
    git \
    build-base \
    libc6-compat


RUN mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz && \
    mv hugo /usr/local/bin/hugo

RUN set -ex; \
    curl -sL https://github.com/${CODEUSER}/myblog/raw/master/shared/entrypoint.sh -o /usr/local/bin/entrypoint; \
    chmod +x /usr/local/bin/entrypoint;

COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/

RUN set -ex; \
    hugo new site html; \
    git clone ${GITTHEMEURL} /var/www/html/themes/${THEME} ; \
    echo "theme = \"${THEME}\"" >> /var/www/html/config.toml;

EXPOSE 80




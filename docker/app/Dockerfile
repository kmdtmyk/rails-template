FROM ruby:2.6.3-alpine

RUN apk update && \
    apk add \
    # nokogiri
    build-base \
    libxml2-dev \
    libxslt-dev \
    # postgresql
    postgresql-dev \
    # others
    nodejs \
    tzdata \
    vim \
    bash \
    sudo

ARG uid
ARG gid

# add user
RUN addgroup -g $gid docker && \
    adduser -S -u $uid -G docker docker && \
    echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo 'docker:docker' | chpasswd

USER docker

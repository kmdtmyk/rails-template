FROM ruby:2.7.4-alpine3.13

RUN echo 'Set disable_coredump false' >> /etc/sudo.conf

RUN apk update && \
    apk add \
    # nokogiri
    build-base \
    # postgresql
    postgresql-dev \
    # others
    nodejs \
    yarn \
    tzdata \
    git \
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

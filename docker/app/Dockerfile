FROM ruby:2.4

RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      libpq-dev \
      postgresql-client \
      nodejs \
      sudo

# add user
RUN groupadd -g 1000 docker && \
    useradd -g docker -G sudo -m -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd

USER docker

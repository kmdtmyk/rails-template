FROM ruby:2.5.3

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    sudo

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt install -y nodejs

RUN npm install -g yarn

ARG uid
ARG gid

# add user
RUN groupadd -g $gid docker && \
    useradd -u $uid -g docker -G sudo -m -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd

USER docker

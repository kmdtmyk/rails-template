FROM rails:5

# install sudo
RUN apt-get update && apt-get install -y sudo

# add user
RUN groupadd -g 1000 docker && \
    useradd -g docker -G sudo -m -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd

USER docker

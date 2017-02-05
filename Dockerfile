FROM jenkins:latest

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN wget -P /tmp/ https://get.docker.com/builds/Linux/x86_64/docker-1.13.0.tgz
RUN tar zxvf /tmp/docker-1.13.0.tgz -C /tmp
RUN mv /tmp/docker/docker /usr/bin/docker
RUN chmod +x /usr/bin/docker

USER jenkins
FROM pascalgrimaud/ubuntu
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install curl
RUN apt-get -y install curl

# install nodeJs
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get -y install nodejs

# update npm
RUN npm install -g npm

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]


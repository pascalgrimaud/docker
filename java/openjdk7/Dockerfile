FROM ubuntu:trusty
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install openjdk-7
RUN apt-get -y install openjdk-7-jdk

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# default command
CMD ["bash"]

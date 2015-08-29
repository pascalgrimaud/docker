FROM pascalgrimaud/<template>:<version>
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install software-properties-common (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q software-properties-common

# install utilities
RUN apt-get -y install wget

# install

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose ports
EXPOSE <port>

# add help
ADD help /usr/local/bin/
ADD help.txt /
RUN chmod 755 /usr/local/bin/help

# script to start the container
ADD run.sh /run.sh
RUN chmod 755 /*.sh
CMD ["/run.sh"]

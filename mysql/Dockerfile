FROM pascalgrimaud/ubuntu
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# installation : mysql
ENV MYSQL_VERSION 5.6
RUN apt-get -y install mysql-server--${MYSQL_VERSION} \
	mysql-client-${MYSQL_VERSION}

# configuration :

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose ports
EXPOSE 3306

# volumes
VOLUME ["/var/log/mysql", "/var/lib/mysql"]

# script to start the container
ADD mysql_run.sh /mysql_run.sh
RUN chmod 755 /*.sh
CMD ["/mysql_run.sh"]


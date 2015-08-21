FROM pascalgrimaud/java:5
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update
RUN apt-get -y install zip wget

# download jboss 4.2.2
# TODO

# install jboss
ADD jboss-4.2.2.GA.zip /jboss-4.2.2.GA.zip
RUN unzip jboss-4.2.2.GA.zip -d /opt && rm jboss-4.2.2.GA.zip

# configuration
# TODO...

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose ports
EXPOSE 8080

ENV JAVA_HOME /usr/lib/jvm/jdk1.5.0_22/

# script to start the container
ADD jboss_run.sh /jboss_run.sh
RUN chmod 755 /*.sh
CMD ["/jboss_run.sh"]

FROM pascalgrimaud/java:5
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update
RUN apt-get -y install zip wget

# install jboss
RUN wget -O /tmp/jboss-4.2.2.GA.zip \
    http://iweb.dl.sourceforge.net/project/jboss/JBoss/JBoss-4.2.2.GA/jboss-4.2.2.GA.zip
RUN unzip /tmp/jboss-4.2.2.GA.zip -d /opt && rm /tmp/jboss-4.2.2.GA.zip

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose ports
EXPOSE 8080

# set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/jdk1.5.0_22/

# add help
ADD help /usr/local/bin/
ADD help.txt /
RUN chmod 755 /usr/local/bin/help

# script to start the container
ADD jboss_run.sh /jboss_run.sh
RUN chmod 755 /*.sh
CMD ["/jboss_run.sh"]

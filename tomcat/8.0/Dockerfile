FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install java7
RUN apt-get install -y openjdk-7-jre
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# install pwgen and unzip
RUN apt-get install -y pwgen wget

# install tomcat
RUN wget -q http://apache.mirrors.ovh.net/ftp.apache.org/dist/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz
RUN echo "c7c289bafa526c3f91c5c4648e42afff /apache-tomcat-8.0.22.tar.gz" | md5sum -c
RUN tar zxvf apache-tomcat-8.0.22.tar.gz
RUN rm /apache-tomcat-8.0.22.tar.gz
ENV CATALINA_HOME /apache-tomcat-8.0.22

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD tomcat_run.sh /tomcat_run.sh
RUN chmod 755 /*.sh

EXPOSE 8080
CMD ["/tomcat_run.sh"]


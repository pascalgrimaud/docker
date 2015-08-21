FROM pascalgrimaud/ubuntu
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install python-software-properties (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

# install utilities
RUN apt-get -y install wget

# install oracle java from PPA
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get -y -qq update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer
RUN update-java-alternatives -s java-8-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

# install tomcat
RUN wget -O /tmp/apache-tomcat-8.0.23.tar.gz \
    http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz 
RUN echo "f4381824abf458650f72ec12d8e81fde /tmp/apache-tomcat-8.0.23.tar.gz" | md5sum -c
RUN tar zxvf /tmp/apache-tomcat-8.0.23.tar.gz -C /opt/
ENV CATALINA_HOME /opt/apache-tomcat-8.0.23

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose ports
EXPOSE 8080 1898 62911

# add help
ADD help help.txt /
RUN chmod 755 /help

# script to start the container
ADD tomcat_run.sh /tomcat_run.sh
RUN chmod 755 /*.sh
CMD ["/tomcat_run.sh"]

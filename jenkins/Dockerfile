FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get -y update

# install python-software-properties (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

RUN apt-get install -y wget git curl zip

# install oracle java from PPA
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer && apt-get clean

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set oracle java as the default java
RUN update-java-alternatives -s java-8-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

# configuration 
ENV JENKINS_HOME /var/jenkins_home

ADD jenkins_run.sh /jenkins_run.sh
RUN chmod 755 /*.sh

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["${JENKINS_HOME}"]

EXPOSE 8080 50000
CMD ["/jenkins_run.sh"]


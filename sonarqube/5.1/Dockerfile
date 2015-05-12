FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install java7
RUN apt-get install -y openjdk-7-jre
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# install pwgen and unzip
RUN apt-get install -y pwgen wget unzip

# install sonarqube
RUN wget -O /tmp/sonarqube-5.1.zip http://dist.sonar.codehaus.org/sonarqube-5.1.zip
RUN echo "6a70c7df869eea4079b405f183f81b3e /tmp/sonarqube-5.1.zip" | md5sum -c
RUN unzip /tmp/sonarqube-5.1.zip

# configuration
ADD sonarqube_run.sh /sonarqube_run.sh
RUN chmod 755 /*.sh

EXPOSE 9000
CMD ["/sonarqube_run.sh"]

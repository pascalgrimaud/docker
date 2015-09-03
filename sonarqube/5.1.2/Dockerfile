FROM pascalgrimaud/java:8
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install wget zip
RUN apt-get -y install wget zip

# install sonarqube
RUN wget -O /tmp/sonarqube-5.1.2.zip http://dist.sonar.codehaus.org/sonarqube-5.1.2.zip
RUN echo "b626939d25d2ffa84c53d76ffbf5fae9 /tmp/sonarqube-5.1.2.zip" | md5sum -c
RUN unzip /tmp/sonarqube-5.1.2.zip -d /opt/
ENV SONAR_HOME /opt/sonarqube-5.1.2

# configuration
# example with postgres :
# RUN sed -i -e 's/#sonar.jdbc.username=sonar/sonar.jdbc.username=sonar/' ${SONAR_HOME}/conf/sonar.properties
# RUN sed -i -e 's/#sonar.jdbc.password=sonar/sonar.jdbc.password=sonar/' ${SONAR_HOME}/conf/sonar.properties
# RUN sed -i -e 's/#sonar.jdbc.url=jdbc:postgresql:\/\/localhost\/sonar/sonar.jdbc.url=jdbc:postgresql:\/\/localhost\/sonar/' ${SONAR_HOME}/conf/sonar.properties

# example by replacing the file sonar.properties :
# ADD sonar.properties ${SONAR_HOME}/conf/sonar.properties

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose ports
EXPOSE 9000

# volumes
# VOLUME ["/directory_1", "/directory_2"]

# script to start the container
ADD sonarqube_run.sh /sonarqube_run.sh
RUN chmod 755 /*.sh
CMD ["/sonarqube_run.sh"]

FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install java7
RUN apt-get install -y openjdk-7-jre
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# install pwgen and unzip
RUN apt-get install -y pwgen wget unzip

# download jboss
ADD jboss-eap-6.1.0.zip /jboss-eap-6.1.0.zip
RUN unzip jboss-eap-6.1.0.zip && \
    rm jboss-eap-6.1.0.zip

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configuration
RUN sed -i -r 's/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:0.0.0.0/' /jboss-eap-6.1/standalone/configuration/standalone.xml

ADD jboss_run.sh /jboss_run.sh
RUN chmod 755 /*.sh

EXPOSE 8080 9990
CMD ["/jboss_run.sh"]


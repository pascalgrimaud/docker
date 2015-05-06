FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install pwgen and unzip
RUN apt-get install -y pwgen wget

# install java7
RUN apt-get install -y openjdk-7-jre

# download jboss
RUN wget -q http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz && \
    tar zxf jboss-as-7.1.1.Final.tar.gz && \
    rm jboss-as-7.1.1.Final.tar.gz

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i -r 's/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:0.0.0.0/' /jboss-as-7.1.1.Final/standalone/configuration/standalone.xml

ADD jboss_run.sh /jboss_run.sh
ADD jboss_set_pass.sh /jboss_set_pass.sh
RUN chmod 755 /*.sh

# Exposed ENV
ENV JBOSS_PASS **Random**

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 8080 9990
CMD ["/jboss_run.sh"]


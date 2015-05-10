FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get -y update

# install python-software-properties (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

# install oracle java from PPA
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get -y -qq update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer
RUN update-java-alternatives -s java-8-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

# install utilities
RUN apt-get install -y wget curl

# install jenkins
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /tmp/jenkins.war
RUN mv /tmp/jenkins.war /jenkins.war
ENV JENKINS_HOME /jenkins/jenkins_home

# install git
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get -y -qq update
RUN apt-get -y install git

# install svn
RUN apt-get -y install subversion

# install ant
ADD https://www.apache.org/dist/ant/binaries/apache-ant-1.9.4-bin.tar.gz /tmp/apache-ant-1.9.4-bin.tar.gz
RUN echo "90c0d07d345a650f026107212c0be6af /tmp/apache-ant-1.9.4-bin.tar.gz" | md5sum -c
RUN tar xzf /tmp/apache-ant-1.9.4-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-ant-1.9.4 /opt/ant
ENV ANT_HOME /opt/ant

# install maven
ADD http://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz /tmp/apache-maven-3.3.3-bin.tar.gz
RUN echo "794b3b7961200c542a7292682d21ba36 /tmp/apache-maven-3.3.3-bin.tar.gz" | md5sum -c
RUN tar xzf /tmp/apache-maven-3.3.3-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.3 /opt/maven
ENV MAVEN_HOME /opt/maven

# configuration
ADD jenkins_run.sh /jenkins_run.sh
RUN chmod 755 /*.sh
ADD settings.xml /root/.m2/settings.xml

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add VOLUMEs to allow backup of config
VOLUME ["/jenkins"]

EXPOSE 8080 50000
CMD ["/jenkins_run.sh"]

FROM pascalgrimaud/jenkins
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# install oracle java from PPA
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get -y -qq update

# install java 7
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java7-installer

# install java 6
RUN echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java6-installer

# install Sun JDK 1.5.0_22
RUN cd /tmp ;\
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O jdk-1_5_0_22-linux-amd64.bin http://download.oracle.com/otn-pub/java/jdk/1.5.0_22/jdk-1_5_0_22-linux-amd64.bin
RUN cd /tmp ;\
    echo yes|sh /tmp/jdk-1_5_0_22-linux-amd64.bin
RUN mv /tmp/jdk1.5.0_22 /usr/lib/jvm/

# install Sun JDK 1.4.2_19
RUN cd /tmp ;\
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O j2sdk-1_4_2_19-linux-i586.bin http://download.oracle.com/otn-pub/java/j2sdk/1.4.2_19/j2sdk-1_4_2_19-linux-i586.bin
RUN cd /tmp ;\
    echo yes|sh /tmp/j2sdk-1_4_2_19-linux-i586.bin
RUN mv /tmp/j2sdk1.4.2_19 /usr/lib/jvm/

# install maven 2.2
RUN wget -O /tmp/apache-maven-2.2.1-bin.tar.gz http://archive.apache.org/dist/maven/maven-2/2.2.1/binaries/apache-maven-2.2.1-bin.tar.gz
RUN echo "3f829ed854cbacdaca8f809e4954c916 /tmp/apache-maven-2.2.1-bin.tar.gz" | md5sum -c
RUN tar xzf /tmp/apache-maven-2.2.1-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-2.2.1 /opt/maven2

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM pascalgrimaud/ubuntu
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# install utilities
RUN apt-get -y install wget

# update
RUN apt-get -y update

# install Sun JDK 1.4.2_19
RUN cd /tmp ;\
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O j2sdk-1_4_2_19-linux-i586.bin http://download.oracle.com/otn-pub/java/j2sdk/1.4.2_19/j2sdk-1_4_2_19-linux-i586.bin
RUN cd /tmp ;\
    echo yes|sh /tmp/j2sdk-1_4_2_19-linux-i586.bin
RUN mv /tmp/j2sdk1.4.2_19 /usr/lib/jvm/
RUN echo "export JAVA_HOME=/usr/lib/jvm/j2sdk-1_4_2_19-linux-i586.bin" >> ~/.bashrc

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


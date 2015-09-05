FROM ubuntu:trusty
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install utilities
RUN apt-get -y install wget

# install 32 bits lib
RUN apt-get install libc6-i386

# install Sun JDK 1.4.2_19
RUN cd /tmp ;\
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O j2sdk-1_4_2_19-linux-i586.bin http://download.oracle.com/otn-pub/java/j2sdk/1.4.2_19/j2sdk-1_4_2_19-linux-i586.bin
RUN cd /tmp ;\
    echo yes|sh /tmp/j2sdk-1_4_2_19-linux-i586.bin
RUN mkdir -p /usr/lib/jvm/
RUN mv /tmp/j2sdk1.4.2_19 /usr/lib/jvm/

# env
ENV JAVA_HOME /usr/lib/jvm/j2sdk1.4.2_19
ENV PATH $PATH:$JAVA_HOME/bin

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# default command
CMD ["bash"]

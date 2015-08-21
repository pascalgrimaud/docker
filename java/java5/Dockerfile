FROM pascalgrimaud/ubuntu
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# install utilities
RUN apt-get -y install wget

# update
RUN apt-get -y update

# install Sun JDK 1.5.0_22
RUN cd /tmp ;\
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -O jdk-1_5_0_22-linux-amd64.bin http://download.oracle.com/otn-pub/java/jdk/1.5.0_22/jdk-1_5_0_22-linux-amd64.bin
RUN cd /tmp ;\
    echo yes|sh /tmp/jdk-1_5_0_22-linux-amd64.bin
RUN mkdir -p /usr/lib/jvm/
RUN mv /tmp/jdk1.5.0_22/ /usr/lib/jvm/
RUN echo "export JAVA_HOME=/usr/lib/jvm/jdk1.5.0_22" >> ~/.bashrc
RUN echo "export PATH=$PATH:/usr/lib/jvm/jdk1.5.0_22/bin" >> ~/.bashrc

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]

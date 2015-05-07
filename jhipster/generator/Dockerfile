FROM pgrimaud/jhipster-stack
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# JHipster version
ENV JHIPSTER_VERSION 2.10.1

# install SSH server so we can connect multiple times to the container
RUN apt-get -y install openssh-server && mkdir /var/run/sshd

# install JHipster
RUN npm install -g generator-jhipster@${JHIPSTER_VERSION}

# configure the "jhipster" and "root" users
RUN echo 'root:jhipster' |chpasswd
RUN groupadd jhipster && useradd jhipster -s /bin/bash -m -g jhipster -G jhipster && adduser jhipster sudo
RUN echo 'jhipster:jhipster' |chpasswd

# install the sample app to download all Maven dependencies
RUN cd /home/jhipster && \
    wget https://github.com/jhipster/jhipster-sample-app/archive/v${JHIPSTER_VERSION}.zip && \
    unzip v${JHIPSTER_VERSION}.zip && \
    rm v${JHIPSTER_VERSION}.zip
RUN cd /home/jhipster/jhipster-sample-app-${JHIPSTER_VERSION} && npm install
RUN cd /home && chown -R jhipster:jhipster /home/jhipster
RUN cd /home/jhipster/jhipster-sample-app-${JHIPSTER_VERSION} && sudo -u jhipster mvn dependency:go-offline

# expose the working directory, the Tomcat port, the BrowserSync ports, the SSHD port, and run SSHD
VOLUME ["/jhipster"]
EXPOSE 8080 3000 3001 22
CMD    /usr/sbin/sshd -D

FROM pascalgrimaud/tomcat:8.0.23

# install oracle java from PPA
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get -y -qq update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer
RUN update-java-alternatives -s java-8-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
RUN apt-get install oracle-java8-set-default
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# ADD bubux.war /opt/apache-tomcat-8.0.23/webapps/bubux.war
ADD server.xml /opt/apache-tomcat-8.0.23/conf/
ADD context.xml /opt/apache-tomcat-8.0.23/conf/
ADD mysql-connector-java-5.1.33.jar /opt/apache-tomcat-8.0.23/lib/

ENV CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=62911,server=y,suspend=n"
ENV CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote="
ENV CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote.port=1898 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"
ENV CATALINA_OPTS="${CATALINA_OPTS} -Djava.rmi.server.hostname=192.168.1.31"
ENV CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote.rmi.port=1898"

EXPOSE 1898 62911


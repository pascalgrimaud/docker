FROM pascalgrimaud/java:8

RUN apt-get update && apt-get install -y wget

# install eclipse
RUN wget -O /tmp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz \
    http://mirror.ibcp.fr/pub/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz
RUN tar xzf /tmp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz -C /opt/

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /home/developer/.eclipse && \
    mkdir -p /home/developer/workspace && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
RUN chown developer:developer /home/developer/.eclipse
WORKDIR /home/developer

RUN sudo apt-get install libswt-gtk-3-java -y

CMD /opt/eclipse/eclipse

FROM ubuntu:trusty
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# set UTF-8 locale
RUN locale-gen en_US.UTF-8
RUN TEST=$(locale-gen en_US.UTF-8 | grep failed); if [ "$TEST" == "en_US.UTF-8... failed" ]; then locale-gen-failed ; fi

RUN ls -l /usr/lib/locale/
RUN locale -a


RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale
RUN cat /etc/default/locale

CMD ["/bin/bash"]

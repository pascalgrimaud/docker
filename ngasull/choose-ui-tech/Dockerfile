FROM pascalgrimaud/nodejs:0.12
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install python-software-properties (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

# install git
RUN apt-get -y install git

# clone app
RUN cd /
RUN git clone https://github.com/ngasull/choose-ui-tech-2015-08.git
RUN cd /choose-ui-tech-2015-08/ ; npm install

# expose port
EXPOSE 3000

ADD npmstart.sh /npmstart.sh
RUN chmod 755 /npmstart.sh

CMD ["/npmstart.sh"]


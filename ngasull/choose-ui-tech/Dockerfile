FROM pascalgrimaud/nodejs:0.12
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install git
RUN apt-get -y install wget zip

RUN apt-get -y install git

# install python-software-properties (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

# dl app
# RUN wget https://github.com/ngasull/choose-ui-tech-2015-08/archive/master.zip
RUN cd /
RUN git clone https://github.com/ngasull/choose-ui-tech-2015-08.git
RUN cd /choose-ui-tech-2015-08/
RUN pwd
RUN ls -l
RUN cd /choose-ui-tech-2015-08/ && npm install

EXPOSE 3000
EXPOSE 55222 55223 55224 55225 55226

ADD npmstart.sh /npmstart.sh
RUN chmod 755 /npmstart.sh

CMD ["/npmstart.sh"]

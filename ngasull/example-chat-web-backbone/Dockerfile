FROM pascalgrimaud/nodejs:0.12
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install python-software-properties software-properties-common (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

# install g++ make
RUN apt-get -y install g++
RUN apt-get -y install make

# install example-chat-web-backbone
RUN mkdir example-chat-web-backbone ; \
    cd example-chat-web-backbone/ ; \
    npm install example-chat-web-backbone

# expose port
EXPOSE 3000

# start the container
CMD ["node", "/example-chat-web-backbone/node_modules/example-chat-web-backbone/server/index.js"]

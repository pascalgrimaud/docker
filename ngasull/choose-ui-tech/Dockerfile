FROM pascalgrimaud/nodejs:0.12
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# install software-properties-common (so you can do add-apt-repository)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q software-properties-common

# install git g++ make
RUN apt-get -y install git
RUN apt-get -y install g++
RUN apt-get -y install make

# clone app
RUN cd / ; git clone https://github.com/pascalgrimaud/choose-ui-tech-2015-08.git
RUN cd /choose-ui-tech-2015-08/ ; npm install

# expose port
EXPOSE 3000

# fix the host, help by this : https://github.com/webpack/webpack-dev-server/issues/163
RUN sed -i -e "s/new Server(webpack(wpOpt), options).listen(options.port, options.host, function(err)/new Server(webpack(wpOpt), options).listen(options.port, '0.0.0.0', function(err)/" /choose-ui-tech-2015-08/node_modules/webpack-dev-server/bin/webpack-dev-server.js
RUN chmod 755 /choose-ui-tech-2015-08/node_modules/webpack-dev-server/bin/webpack-dev-server.js

# script to start the container
ADD npmstart.sh /npmstart.sh
RUN chmod 755 /npmstart.sh
CMD ["/npmstart.sh"]

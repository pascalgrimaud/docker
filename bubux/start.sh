#!/bin/bash
docker run -d -p 8080:8080 -p 1898:1898 -p 62911:62911 --link bubux_mysql:mysql -v /home/pgrimaud/workspace/bubux/bubux/bubux-web/target/bubux-0.0.1-SNAPSHOT:/opt/apache-tomcat-8.0.23/webapps/bubux-0.0.1-SNAPSHOT tomcat/bubux

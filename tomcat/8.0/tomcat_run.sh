#!/bin/bash

echo "Starting container..."

if [ "$TOMCAT_PASS" = "**Random**" ]; then
    unset TOMCAT_PASS
fi

# change the password
if [ ! -f /.tomcat_admin_pass_configured ]; then
	# generate password
	PASS=${TOMCAT_PASS:-$(pwgen -s 12 1)}
	_word=$( [ ${TOMCAT_PASS} ] && echo "preset" || echo "random" )

	echo "Configuring admin user with a ${_word} password in Tomcat"
	sed -i -e 's/<\/tomcat-users>//' ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<role rolename="admin-gui"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<role rolename="admin-script"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<role rolename="manager-gui"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<role rolename="manager-script"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<role rolename="manager-jmx"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<role rolename="manager-status"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '<user username="tomcat" password="'${PASS}'" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-script,admin-gui"/>' >> ${CATALINA_HOME}/conf/tomcat-users.xml
	echo '</tomcat-users>' >> ${CATALINA_HOME}/conf/tomcat-users.xml

	echo "Done!"
	touch /.tomcat_admin_pass_configured

	echo "================================================================================"
	echo "You can now configure to this Tomcat server using:"
	echo ""
	echo "    Username : tomcat"
	echo "    Password : ${PASS}"
	echo ""
	echo "================================================================================"
else
    echo "Tomcat admin user's password already modified!"
fi

exec /apache-tomcat-8.0.22/bin/catalina.sh run


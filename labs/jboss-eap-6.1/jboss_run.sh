#!/bin/bash

echo "Starting container : JBoss EAP 6.1.0 GA (build from AS 7.2)"

# change the password
if [ ! -f /.jboss_admin_pass_configured ]; then
	# generate password
	PASS=${JBOSS_PASS:-$(pwgen -s 12 1)}
	# add special caracter at the end --> !
	PASS=$PASS!
	_word=$( [ ${JBOSS_PASS} ] && echo "preset" || echo "random" )

	echo "Configuring admin user with a ${_word} password in JBoss"
	/jboss-eap-6.1/bin/add-user.sh --silent admin ${PASS}
	echo "Done!"
	touch /.jboss_admin_pass_configured

	echo "================================================================================"
	echo "You can now configure to this JBoss server using:"
	echo ""
	echo "    Username : admin"
	echo "    Password : ${PASS}"
	echo ""
	echo "================================================================================"
else
    echo "JBoss admin user's password already modified!"
fi

exec /jboss-eap-6.1/bin/standalone.sh -b=0.0.0.0


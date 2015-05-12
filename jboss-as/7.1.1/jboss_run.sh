#!/bin/bash

echo "Starting container : JBoss AS 7.1.1"

# change the password
if [ ! -f /.jboss_admin_pass_configured ]; then
	# generate password
	PASS=${JBOSS_PASS:-$(pwgen -s 12 1)}
	_word=$( [ ${JBOSS_PASS} ] && echo "preset" || echo "random" )

	echo "Configuring admin user with a ${_word} password in JBoss"
	/jboss-as-7.1.1.Final/bin/add-user.sh --silent=true admin ${PASS}
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

exec /jboss-as-7.1.1.Final/bin/standalone.sh -b=0.0.0.0


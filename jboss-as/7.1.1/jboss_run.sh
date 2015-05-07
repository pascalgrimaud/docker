#!/bin/bash

echo "Starting container..."

if [ "$JBOSS_PASS" = "**Random**" ]; then
    unset JBOSS_PASS
fi

# change the password
if [ ! -f /.jboss_admin_pass_configured ]; then
	# generate password
	PASS=${JBOSS_PASS:-$(pwgen -s 12 1)}
	# add special caracter at the end --> !
	PASS=$PASS!
	_word=$( [ ${JBOSS_PASS} ] && echo "preset" || echo "random" )

	echo "=> Configuring admin user with a ${_word} password in JBoss"
	/jboss-as-7.1.1.Final/bin/add-user.sh --silent=true admin ${PASS}
	echo "=> Done!"
	touch /.jboss_admin_pass_configured

	echo "================================================================================"
	echo "You can now configure to this JBoss server using:"
	echo ""
	echo "    admin:${PASS}"
	echo ""
	echo "================================================================================"
else
    echo "JBoss admin user's password already modified!"
fi

exec /jboss-as-7.1.1.Final/bin/standalone.sh -b=0.0.0.0


#!/bin/bash

echo "Starting container : JBoss EAP 6.1"

# change the password
if [ ! -f /.password ]; then
	echo "Initializing the admin user password..."

	# generate password
	PASS=${JBOSS_PASS:-$(date +%s | sha256sum | base64 | head -c 16 ; echo)}
	# add special caracter at the end --> !
	PASS=${PASS}!
	# change password : use --silent instead of --silent=true
	/opt/jboss-eap-6.1/bin/add-user.sh --silent admin ${PASS}
	touch /.password
	echo "Initializing the admin user password : done!"
fi

# display info
echo ""
echo "######################################################################"
echo "You can now configure to this JBoss server using:"
echo ""
echo "    Username : admin"
if [ ! -d ${PASS} ]; then
	echo "    Password : ${PASS}"
else
	echo "    Password : ****************"
fi
echo ""
echo "######################################################################"
echo ""

# start JBoss
exec /opt/jboss-eap-6.1/bin/standalone.sh -b=0.0.0.0
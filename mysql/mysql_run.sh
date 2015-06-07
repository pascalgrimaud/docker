#!/bin/bash

echo "Starting container : mysql 5.6"

# initialize mysql data directory
if [ ! -d ${MYSQL_DATADIR} ]; then
	echo "Initializing database..."
	sudo -u postgres -H "${PG_BINDIR}/initdb" \
		--pgdata="${PG_DATADIR}" \
		--username=postgres \
		--encoding=unicode \
		--lc-collate='en_US.UTF-8' \
		--lc-ctype='en_US.UTF-8' \
		--auth=trust >/dev/null
	echo "Initializing database : ok"
fi

# change the password
if [ ! -f /.password ]; then
	echo "Initializing the user password..."

	# generate password
	PASS=${MYSQL_PASS:-$(date +%s | sha256sum | base64 | head -c 16 ; echo)}
	# change password
    # ---> put code here
    # touch this file ...
	touch /.password

	echo "Initializing the user password : done!"
fi

# display info
echo ""
echo "######################################################################"
echo "You can now connect to this mysql database using :"
echo ""
echo "    <information>"
if [ ! -d ${PASS} ]; then
	echo "    with the password '$PASS'"
	echo ""
	echo "Please remember to change the above password as soon as possible!"
else
	echo "    and enter the password"
fi
echo ""
echo "######################################################################"
echo ""

# start service
exec mysqld

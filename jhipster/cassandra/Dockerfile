FROM cassandra
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# add script cql
ADD create-keyspace.cql /create-keyspace.cql
ADD create-tables.cql /create-tables.cql

# concat 2 scripts to 1
RUN cat create-keyspace.cql > create-keyspace-tables.cql
RUN echo "USE pgr;" >> create-keyspace-tables.cql
RUN cat create-tables.cql >> create-keyspace-tables.cql

# init, for easier docker exec
RUN echo "#!/bin/bash" > /usr/local/bin/init
RUN echo "cqlsh -f create-keyspace-tables.cql" >> /usr/local/bin/init
RUN chmod 755 /usr/local/bin/init

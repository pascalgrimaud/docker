FROM cassandra
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

ADD create-keyspace.cql /cql/create-keyspace.cql
ADD create-tables.cql /cql/create-tables.cql

# script to start the container
ADD cassandra_run.sh /cassandra_run.sh
RUN chmod 755 /*.sh
CMD ["/cassandra_run.sh"]

FROM ubuntu:14.04
MAINTAINER Pascal Grimaud <pascalgrimaud@gmail.com>

# update
RUN apt-get -y update

# Ensure we create the cluster with UTF-8 locale
RUN locale-gen en_US.UTF-8 && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale

# install postgresql-9.3
RUN apt-get install -y postgresql-9.3 pwgen

# clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Adjust PostgreSQL configuration so that remote connections to the database are possible. 
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME	["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ADD postgresql_modify_pass.sh ./postgresql_modify_pass.sh
ADD postgresql_run.sh /postgresql_run.sh
RUN chmod 755 /*.sh

EXPOSE 5432
CMD ["/postgresql_run.sh"]


FROM registry.access.redhat.com/openshift3/postgresql-92-rhel7
USER root
RUN  mkdir -p /init/test
ADD ./initfile.sql /init/test/initfile.sql
ADD ./setup.sh /init/test/setup.sh
#RUN echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/data/userdata/pg_hba.conf 
RUN  chmod -R 777 /init/test
USER 26

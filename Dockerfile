FROM registry.access.redhat.com/openshift3/postgresql-92-rhel7
ADD ./initfile.sql /opt/initfile.sql
RUN chmod  -R 777 /opt/

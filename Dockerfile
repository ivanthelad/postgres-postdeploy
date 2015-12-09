FROM registry.access.redhat.com/openshift3/postgresql-92-rhel7
RUN mkdir /opt/test
ADD ./initfile.sql /opt/test/initfile.sql
RUN  chmod -R 777 /opt/test

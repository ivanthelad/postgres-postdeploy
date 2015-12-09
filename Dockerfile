FROM registry.access.redhat.com/openshift3/postgresql-92-rhel7
USER root
RUN  mkdir -p /init/test
ADD ./initfile.sql /init/test/initfile.sql
ADD ./setup.sh /init/test/setup.sh

RUN  chmod -R 777 /init/test
USER 26

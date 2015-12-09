FROM registry.access.redhat.com/openshift3/postgresql-92-rhel7
USER root
RUN echo pwd; mkdir -p /init/test
ADD ./initfile.sql /init/test/initfile.sql
RUN  chmod -R 777 /init/test
USER 26

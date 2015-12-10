
#!/bin/bash

#if [ $# != 2 ]; then
#    echo "please enter a db host and a table suffix"
#    exit 1
#fi
env

#export DBHOST=$1
set PGPASSWORD=$POSTGRESQL_PASSWORD
export PGPASSWORD=$POSTGRESQL_PASSWORD
nslookup $POSTGRESQL_SERVICE_HOST
echo waiting 20 secs for postgres to start;
sleep 20;
echo postgres should be started now done
psql -w \
    -U $POSTGRESQL_USER \
    -h $POSTGRESQL_SERVICE_HOST \
    -f /init/test/initfile.sql \
    --echo-all \
    -d $POSTGRESQL_DATABASE

psql_exit_status = $?

if [ $psql_exit_status != 0 ]; then
    echo "psql failed while trying to run this sql script" 1>&2
    exit $psql_exit_status
fi

echo "sql script successful"
exit 0

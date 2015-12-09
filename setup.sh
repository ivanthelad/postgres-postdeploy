
#!/bin/bash
set -e
set -u

#if [ $# != 2 ]; then
#    echo "please enter a db host and a table suffix"
#    exit 1
#fi

#export DBHOST=$1
SET PGPASSWORD=$POSTGRESQL_PASSWORD

psql -w \
    -X \
    -U $POSTGRESQL_USER \
    -h $POSTGRESQL_SERVICE_HOST \
    -f /init/test/initfile.sql \
    --echo-all \
    --set AUTOCOMMIT=off \
    --set ON_ERROR_STOP=on \
    $POSTGRESQL_DATABASE

psql_exit_status = $?

if [ $psql_exit_status != 0 ]; then
    echo "psql failed while trying to run this sql script" 1>&2
    exit $psql_exit_status
fi

echo "sql script successful"
exit 0

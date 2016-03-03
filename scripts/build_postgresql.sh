#!/bin/bash

set -e

cd git-postgres
./configure
gmake
#echo "========= running gmake check ============="
#gmake check

# su
echo "========= running gmake install ============="
gmake install

#adduser --disabled-password --gecos ""  postgres
#mkdir /usr/local/pgsql/data
#chown postgres /usr/local/pgsql/data

echo "Starting postgres"
/usr/local/pgsql/bin/initdb -A -D /usr/local/pgsql/data

echo "start postgres and logs"
/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start

echo "===============   check postgres installations  ======================="
echo "======================================================================="
gmake installcheck
#su - postgres
#/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
#/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >logfile 2>&1 &
#/usr/local/pgsql/bin/createdb test
#/usr/local/pgsql/bin/psql test
exit

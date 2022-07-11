#!/bin/bash
set -eux

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Demo PostgreSQL Database initialisation
psql postgres -c "CREATE USER thor PASSWORD 'thorofasgard'"
#The -O flag below sets the user: createdb -O DBUSER DBNAME
createdb -O thor datagod

psql -d datagod -U thor -f $THISDIR/seed_db.sql

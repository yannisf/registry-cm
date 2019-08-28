#!/bin/bash

set -e

createuser -U postgres registry
createdb -U postgres -O registry registry
pg_restore -U postgres -d registry /docker-entrypoint-initdb.d/dump.tar

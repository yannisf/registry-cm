#!/bin/bash

docker exec -t -w /backup compose_registrydb_1 /usr/bin/pg_dump --host=localhost --username=registry --dbname=registry --format=t --file=dump_$(date +"%Y%m%d%H%M").tar

#!/bin/bash

pg_dump --host=localhost --username=registry --dbname=registry --format=t --file=dump_$(date +"%Y%m%d%H%M").tar

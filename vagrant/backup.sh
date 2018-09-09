#!/bin/bash

prefix="registry_dump_"
previous=$(ls -t $prefix* | head -1)
current=$prefix$(date +"\%Y\%m\%d\%H\%M").tar
pg_dump --host=localhost --username=registry --format=t registry > /vagrant/$current

function keep_first_updated {
    previous_md5=$(md5sum $1 | cut -c-31)
    current_md5=$(md5sum $2 | cut -c-31)

    echo "Previous: $1: $previous_md5"
    echo "Current: $2: $current_md5"

    if [ $current_md5 == $previous_md5 ]; then
        echo "Removing $2"
        rm $2
    fi

}

keep_first_updated $previous $current

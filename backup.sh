#!/bin/bash

<<info
This shell script will take periodic backup

eg.
./backup.sh <source> <dest>
info

src=$1
dest=$2

timestamp = $(date '+%Y-%m-%d')

zip -r "$dest/backup-$timestamp.zip" $src > /dev/null

aws s3 sync "$dest" s3://bucket_name

echo "backup completed & uploaded to s3"

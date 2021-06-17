#!/bin/bash
DIR="/Users/kimberlygarmoe/repos/inspec/docs/"
FILES=`ls -r "$DIR" `
for file in $FILES;
do
  sed -i "/^$/N;/^\n$/D" "$file"
  echo "deleted blank lines" "$file"
done

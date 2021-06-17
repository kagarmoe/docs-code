#!/bin/bash
DIR="/Users/kimberlygarmoe/repos/inspec/docs/resources/"
FILES=`ls -r "$DIR" `
for file in $FILES;
do
  sed -i"/<br>/d" "$file"
  echo "deleted line breaks" "$file"
done

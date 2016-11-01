#!/bin/bash -e

HOMEDIR=..
for i in $(ls $HOMEDIR/**/**/*.json);do
  echo $i;
  cat $i | python -m json.tool > /dev/null;
done

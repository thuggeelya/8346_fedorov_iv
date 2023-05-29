#!/bin/bash

sleep 1

if [ "$STATIC_TEST" = "true" ]
then
  annotate-output "+%D %H:%M:%S"  html_lint.py ./templates/*.html
  status=$?

  if [ $status -eq 0 ]
  then
     echo "Html lint: PASSED"
    exit 0
  else
    echo "Html lint: FAILED"
    exit 1
  fi
else
  echo "Html lint: DISABLED"
  exit 1
fi

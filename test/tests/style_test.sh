#!/bin/bash

sleep 1

if [ "$FORMATING_TEST" = "true" ]
then
  find . -type f -name "*.py" -print0 | xargs -0 pylint --rcfile=./tests/.pylintrc
  status=$?

  if [ $status -eq 0 ]
  then
    echo "Pylint: PASSED"
    exit 0
  else
    echo "Pylint: FAILED"
    exit 1
  fi
else
  echo "Pylint: DISABLED"
  exit 1
fi


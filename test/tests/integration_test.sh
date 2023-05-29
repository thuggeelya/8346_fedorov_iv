#!/bin/bash

sleep 1

if [ "$INTEGRATION_TEST" = "true" ]
then
  pytest --log-format="%(asctime)s %(levelname)s %(message)s" -v -rfpP --tb=no ./tests/integration_test.py --disable-warnings --color=yes
  status=$?

  if [ $status -eq 0 ]
  then
     echo "Integration: PASSED"
    exit 0
  else
    echo "Integration: FAILED"
    exit 1
  fi
else
  echo "Integration: DISABLED"
  exit 1
fi

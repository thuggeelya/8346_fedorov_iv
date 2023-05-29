#!/bin/bash

echo "Start xvfb"
Xvfb :1 -screen 0 1024x768x16 &> xvfb.log  &

DISPLAY=:1.0
export DISPLAY

sleep 1

if [ "$SELENIUM_TEST" = "true" ]
then
  pytest --log-format="%(asctime)s %(levelname)s %(message)s" -v -rfpP --tb=no ./tests/selenium_test.py --disable-warnings --color=yes
  status=$?

  if [ $status -eq 0 ]
  then
    echo "Selenium: PASSED"
    kill $(pgrep -f Xvfb)
    echo "Stop xvfb"
    exit 0
  else
    echo "Selenium: FAILED"
    kill $(pgrep -f Xvfb)
    echo "Stop xvfb"
    exit 1
  fi
else
  echo "Selenium: DISABLED"
  exit 1
fi

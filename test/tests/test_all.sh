#!/bin/sh

root=$(dirname $0)


echo "\033[31m===============\nRun pipeline\n===============\033[0m"

start_pylint() {
    echo "\n\033[35m===============Run PyLint for 10 categories test===============\033[0m\n"
    bash ${root}/style_test.sh
    style=$(echo $?)
}

start_html_linter() {
    echo "\n\033[35m=============== Run HTML linter test ===============\033[0m\n"
    bash ${root}/static_test.sh
    static=$(echo $?)
}
start_selenium_tests() {
    echo "\n\033[35m=============== Run Selenium tests ===============\033[0m\n"
    bash ${root}/selenium_test.sh
    selenium=$(echo $?)
}

start_integration_tests() {
    echo "\n\033[35m=============== Run Integration tests ===============\033[0m\n"
    bash ${root}/integration_test.sh
    integration=$(echo $?)
}

get_report() {
  echo "\033[031m===============\n Results \n===============\033[0m"

  if [ "$style" -eq 0 ]
  then
      echo "\033[32mStyle: PASSED\033[0m"
  else
      echo "\033[31mStyle: FAILED\033[0m"
  fi

  if [ "$static" -eq 0 ]
  then
      echo "\033[32mStatic: PASSED\033[0m"
  else
      echo "\033[31mStatic: FAILED\033[0m"
  fi

  if [ "$selenium" -eq 0 ]
  then
      echo "\033[32mSelenium: PASSED\033[0m"
  else
      echo "\033[31mSelenium: FAILED\033[0m"
  fi

  if [ "$integration" -eq 0 ]
  then
      echo "\033[32mIntegration: PASSED\033[0m"
  else
      echo "\033[31mIntegration: FAILED\033[0m"
  fi
}

case "$1" in
  -p)
        start_pylint
        ;;
  -h)
        start_html_linter
        ;;
  -s)
        start_selenium_tests
        ;;
  -i)
        start_integration_tests
        ;;
  *)
        echo "\n\033[31m=============== Run all tests ===============\033[0m\n"
        start_pylint
        start_html_linter
        start_selenium_tests
        start_integration_tests
        echo "\n\033[31m=============== End all tests ===============\033[0m\n"
        get_report
        ;;
esac

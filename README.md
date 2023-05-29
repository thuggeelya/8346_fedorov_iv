# devops-1h2023

## Build Setup
```
docker compose build
docker compose up
```

## Login into the app container via SSH
```
docker compose exec -it app sh start_sshd.sh
ssh root@127.0.0.1 -p 5022
```

## Login into the tester container via SSH
```
docker compose exec -it tester sh start_sshd.sh
ssh root@127.0.0.1 -p 5023
```

## Setting up the environment
### The .env environment options can be used to enable or disable test phases
### Current settings:
```
FORMATING_TEST=false
SELENIUM_TEST=false
STATIC_TEST=true
INTEGRATION_TEST=true
```

## Run all tests
```
docker compose exec -it tester sh tests/test_all.sh
```

## Run pylint tests for 10 categories

```
docker compose exec -it tester sh tests/test_all.sh -p
```

## Run html linter tests

```
docker compose exec -it tester sh tests/test_all.sh -h
```

## Run integration tests

```
docker compose exec -it tester sh tests/test_all.sh -i
```

## Run selenium tests

```
docker compose exec -it tester sh tests/test_all.sh -s
```

## Stop containers
```
docker stop 8346_fedorov_iv-app-1  8346_fedorov_iv-tester-1
```
## Clean up
```
docker rm 8346_fedorov_iv-app-1  8346_fedorov_iv-tester-1
docker rmi 8346_fedorov_iv-app  8346_fedorov_iv-tester
docker network rm 8346_fedorov_iv_default
```

#!/usr/bin/env bash
# cp *.bal testcont/balruntime/benchmarks/
# cp -r files testcont/balruntime/benchmarks/

# cd testcont/balruntime
# docker build . -t bal-benchmark -f bal.Dockerfile
# docker rm bal-benchmark-cont
# docker run --name bal-benchmark-cont -p 9090:9090 --cpus="0.7" -d bal-benchmark


cp -r new_tests testcont/balruntime/new_tests
cd testcont/balruntime
docker build . -t bal-benchmark -f bal.Dockerfile
docker stop bal-benchmark-cont 2 >/dev/null
docker rm bal-benchmark-cont 2 >/dev/null
docker run --name bal-benchmark-cont -p 9090:9090 --cpus="1" --memeory="2g" -d bal-benchmark
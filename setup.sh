#!/usr/bin/env bash
cp *.bal testcont/balruntime/benchmarks/
cp -r files testcont/balruntime/benchmarks/

cd testcont/balruntime
docker build . -t bal-benchmark -f bal.Dockerfile
docker rm bal-benchmark-cont
docker run --name bal-benchmark-cont -p 9090:9090 --cpus="1" bal-benchmark



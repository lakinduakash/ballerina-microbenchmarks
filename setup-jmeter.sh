#!/usr/bin/env bash

cd testcont/jmeter
docker build . -t jmeter -f jmeter.Dockerfile
docker rm jmeter-cont
docker run --mount type=bind,source="$(pwd)"/tests,target=/usr/tests --network host --name jmeter-cont --cpus="0.7" jmeter



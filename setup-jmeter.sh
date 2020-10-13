#!/usr/bin/env bash

cd testcont/jmeter
docker build . -t jmeter -f jmeter.Dockerfile
docker stop jmeter-cont 2> /dev/null
docker rm jmeter-cont 2> /dev/null
docker run --mount type=bind,source="$(pwd)"/tests,target=/usr/tests --network host --name jmeter-cont --cpus="1" jmeter



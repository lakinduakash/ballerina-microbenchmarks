#!/usr/bin/env bash

cd testcont/jmeter

# Download jmeter
if [ ! -d apache-jmeter-5.3 ]; then
    wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.3.tgz && tar -xf apache-jmeter-5.3.tgz apache-jmeter-5.3
fi

docker build . -t jmeter -f jmeter.Dockerfile
docker stop jmeter-cont 2>/dev/null
docker rm jmeter-cont 2>/dev/null
docker run --mount type=bind,source="$(pwd)"/tests,target=/usr/tests --network host --name jmeter-cont --cpus="1" jmeter



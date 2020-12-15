#!/bin/bash

pool_sizes=(2 4 10 25 50 80)

for t in ${pool_sizes[@]}; do

echo "Setting pool size ${t}"

bash setup.sh $t
sleep 10

echo "Running tests..."

bash setup-jmeter.sh $t

echo "finished benchmark with pool size ${t}"
sleep 5

done;
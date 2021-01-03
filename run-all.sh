#!/bin/bash

pool_sizes=(2 3 4 5 6 8 10 12 14 16 18 20)

for t in ${pool_sizes[@]}; do

echo "Setting pool size ${t}"

bash setup.sh $t
sleep 8

echo "Running tests..."

bash setup-jmeter.sh $t

echo "finished benchmark with pool size ${t}"
sleep 1

done;
#!/bin/bash

pool_sizes=(2 3 4 5 6 7 8 9 10 12 14 16 18 22 24 30)

for t in ${pool_sizes[@]}; do

echo "Setting pool size ${t}"

bash setup.sh $t
sleep 10

echo "Running tests..."

bash setup-jmeter.sh $t

echo "finished benchmark with pool size ${t}"
sleep 5

done;
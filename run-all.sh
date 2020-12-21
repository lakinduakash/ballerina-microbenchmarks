#!/bin/bash

pool_sizes=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 22)

for t in ${pool_sizes[@]}; do

echo "Setting pool size ${t}"

bash setup.sh $t
sleep 8

echo "Running tests..."

bash setup-jmeter.sh $t

echo "finished benchmark with pool size ${t}"
sleep 1

done;
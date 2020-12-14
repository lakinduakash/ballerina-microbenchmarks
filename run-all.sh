#!/bin/bash

pool_sizes=(2 4 10 50 75)

for t in ${pool_sizes[@]}; do

echo "Setting pool size ${t}"

bash setup.sh $t
sleep 5

echo "Running tests..."

bash setup-jemeter.sh $t

echo "finished benchmark with pool size ${t}"
sleep 5

done;
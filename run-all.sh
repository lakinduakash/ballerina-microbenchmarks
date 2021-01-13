#!/bin/bash

pool_sizes=(4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 22 3 2 1)

#Remove old results
rm -f testcont/jmeter/tests/results/*.json
rm -f testcont/jmeter/tests/results/*.jtl
rm -f testcont/jmeter/tests/results_*

bash jmeter-build-only.sh
bash ballerina-build-only.sh

#keys for localssh access
ssh-keygen -b 2048 -t rsa -f localssh -q -N ""
cat localssh.pub >> ~/.ssh/authorized_keys
chmod og-wx ~/.ssh/authorized_keys

cp localssh testcont/jmeter/tests/localssh

for t in ${pool_sizes[@]}; do

echo "Setting pool size ${t}"

bash ballerina-run-only.sh $t
sleep 8

echo "Running tests..."

bash jmeter-run-only.sh $t

ssh-keygen -b 2048 -t rsa -f sigmdev -q -N ""

echo "finished benchmark with pool size ${t}"
sleep 1

done;
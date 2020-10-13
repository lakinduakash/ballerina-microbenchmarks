#!/usr/bin/env bash

#Set duration
duration=70 # 30 minutes
ramp_time=1

split_time=10

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.2.1/bin/jmeter"


# Is Prime

echo "Running tests for Is Prime 406423"
prime=406423

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_1.jtl
sleep 5
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=10 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_10.jtl
sleep 5
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_20.jtl
sleep 5

echo "Generating summaries Is Prime"
${jtl_splitter} -f results_is_prime_small_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_small_10.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_small_20.jtl -s -u SECONDS -t ${split_time}
echo "#########################"

echo "Running tests for Is Prime 10674959"
prime=10674959

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_1.jtl
sleep 5
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=10 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_10.jtl
sleep 5
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_20.jtl
sleep 5




echo "Generating summaries Is Prime"
${jtl_splitter} -f results_is_prime_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_10.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_20.jtl -s -u SECONDS -t ${split_time}
echo "#########################"

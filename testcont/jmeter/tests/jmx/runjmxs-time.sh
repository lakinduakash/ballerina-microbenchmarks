#!/usr/bin/env bash

#Set duration
duration=900
ramp_time=1

split_time=300

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.2.1/bin/jmeter"


# Is Prime

### Small Prime

echo "Running tests for Is Prime 406423"
prime=406423

# 15 min duration

duration=900
ramp_time=1
split_time=300

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_15_1.jtl
sleep 10
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=30 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_15_30.jtl
sleep 10

echo "Generating summaries Is Prime"
${jtl_splitter} -f results_is_prime_small_15_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_small_15_30.jtl -s -u SECONDS -t ${split_time}
echo "#########################"


# 10 min duration

duration=600
ramp_time=1
split_time=200

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_10_1.jtl
sleep 10
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=30 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_small_10_30.jtl
sleep 10

echo "Generating summaries Is Prime"
${jtl_splitter} -f results_is_prime_small_10_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_small_10_30.jtl -s -u SECONDS -t ${split_time}
echo "#########################"


### Medium Prime

echo "Running tests for Is Prime 10674959"
prime=10674959

# 15 min duration

duration=900
ramp_time=1
split_time=300

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_medium_15_1.jtl
sleep 10
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=30 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_medium_15_30.jtl
sleep 10

echo "Generating summaries Is Prime"
${jtl_splitter} -f results_is_prime_medium_15_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_medium_15_30.jtl -s -u SECONDS -t ${split_time}
echo "#########################"


# 10 min duration

duration=600
ramp_time=1
split_time=200

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_medium_10_1.jtl
sleep 10
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=30 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l results_is_prime_medium_10_30.jtl
sleep 10

echo "Generating summaries Is Prime"
${jtl_splitter} -f results_is_prime_medium_10_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_is_prime_medium_10_30.jtl -s -u SECONDS -t ${split_time}
echo "#########################"


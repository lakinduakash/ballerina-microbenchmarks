#!/usr/bin/env bash

#Set duration
duration=420 # 7 minutes
ramp_time=1

split_time=120

sleep_duration=5

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"

allThreads=(1 10 20 50 100)

echo "Starting test for thread pool size ${POOL_SIZE}"

echo "Running tests for Is Prime 521"
prime=521

for t in ${allThreads[@]}; do

    filename=${POOL_SIZE}_results_is_prime_small_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for Is Prime 7919"
prime=7919

for t in ${allThreads[@]}; do

    filename=${POOL_SIZE}_results_is_prime_medium_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"


echo "Running tests for db select"

for t in ${allThreads[@]}; do

    filename=${POOL_SIZE}_results_db_select_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Db_Select.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"
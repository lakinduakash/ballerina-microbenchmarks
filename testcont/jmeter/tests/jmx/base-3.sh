#!/usr/bin/env bash

#Set duration
duration=420 # 7 minutes
ramp_time=1

split_time=120

sleep_duration=5

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"

allThreads=(100)

echo "Starting test for thread pool size ${POOL_SIZE}"

echo "Running tests for cpudb"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_cpudb_${t}.jtl

    request_path="microbenchmark/cpudb"

    param_1_name="number"
    param_1_value="7919"

    param_2_name="id"
    param_2_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for dbcpu"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_dbcpu_${t}.jtl

    request_path="microbenchmark/dbcpu"

    param_1_name="number"
    param_1_value="7919"

    param_2_name="id"
    param_2_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for loopdb"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_loopdb_${t}.jtl

    request_path="microbenchmark/loopdb"

    param_1_name="number"
    param_1_value="10"

    param_2_name="id"
    param_2_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for cpu - is prime"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_cpu_${t}.jtl

    request_path="microbenchmark/is_prime"

    param_1_name="number"
    param_1_value="7919"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for db"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_db_select_${t}.jtl

    request_path="microbenchmark/db_select"

    param_1_name="id"
    param_1_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"
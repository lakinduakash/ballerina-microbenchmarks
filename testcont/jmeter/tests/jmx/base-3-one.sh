#!/usr/bin/env bash

#Set duration
duration=300 # 5 minutes
ramp_time=1

split_time=60

sleep_duration=5

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"

allThreads=(100)

echo "Starting test for thread pool size ${POOL_SIZE}"

echo "Running tests for echo_get"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_echoget_${t}.jtl

    request_path="microbenchmark/echoget"

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

echo "Running tests for echo passthrough"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_passthrough_${t}.jtl

    request_path="microbenchmark/passthrough"

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
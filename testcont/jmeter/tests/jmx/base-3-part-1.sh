#!/usr/bin/env bash

#Set duration
duration=300 # 7 minutes
ramp_time=1

split_time=60

sleep_duration=5

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"

allThreads=(80)

echo "Starting test for thread pool size ${POOL_SIZE}"

# echo "Running tests for dbcpu_small"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_dbcpu_small_${t}.jtl

#     request_path="microbenchmark/dbcpu"

#     param_1_name="number"
#     param_1_value="541"

#     param_2_name="id"
#     param_2_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"

# echo "Running tests for dbcpu_large"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_dbcpu_large_${t}.jtl

#     request_path="microbenchmark/dbcpu"

#     param_1_name="number"
#     param_1_value="7919"

#     param_2_name="id"
#     param_2_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"

# echo "Running tests for cpu - is prime large"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_cpu_large_${t}.jtl

#     request_path="microbenchmark/is_prime"

#     param_1_name="number"
#     param_1_value="7919"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"


# echo "Running tests for cpu - is prime small"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_cpu_small_${t}.jtl

#     request_path="microbenchmark/is_prime"

#     param_1_name="number"
#     param_1_value="541"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"

# echo "Running tests for db select 1"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_db_1_${t}.jtl

#     request_path="microbenchmark/db_select"

#     param_1_name="id"
#     param_1_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"

# echo "Running tests for simple echo"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_echo_${t}.jtl

#     request_path="microbenchmark/io"

#     param_1_name="id"
#     param_1_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"

echo "Running tests for loopdb_2"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_loopdb_2_${t}.jtl

    request_path="microbenchmark/loopdb"

    param_1_name="number"
    param_1_value="2"

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

echo "Running tests for loopdb_3"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_loopdb_3_${t}.jtl

    request_path="microbenchmark/loopdb"

    param_1_name="number"
    param_1_value="3"

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

echo "Running tests for loopdb_4"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_loopdb_4_${t}.jtl

    request_path="microbenchmark/loopdb"

    param_1_name="number"
    param_1_value="4"

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

echo "Running tests for loopdb_5"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_loopdb_5_${t}.jtl

    request_path="microbenchmark/loopdb"

    param_1_name="number"
    param_1_value="5"

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

echo "Running tests for loopdb_6"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_loopdb_6_${t}.jtl

    request_path="microbenchmark/loopdb"

    param_1_name="number"
    param_1_value="6"

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
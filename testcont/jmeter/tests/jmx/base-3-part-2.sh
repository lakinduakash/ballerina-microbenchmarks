#!/usr/bin/env bash

#Set duration
duration=300 # 5 minutes
ramp_time=1

split_time=60

sleep_duration=5

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"

allThreads=(80)

echo "Starting test for thread pool size ${POOL_SIZE}"


# echo "Running tests for echo passthrough"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_passthrough_${t}.jtl

#     request_path="microbenchmark/passthrough"

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


# echo "Running tests for http_db"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_http_db_${t}.jtl

#     request_path="microbenchmark/loophttploopdb"

#     param_1_name="db_loop_count"
#     param_1_value="1"

#     param_2_name="http_loop_count"
#     param_2_value="1"

#     param_3_name="id"
#     param_3_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"


# echo "Running tests for http_db_5"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_http_db_5_${t}.jtl

#     request_path="microbenchmark/loophttploopdb"

#     param_1_name="db_loop_count"
#     param_1_value="5"

#     param_2_name="http_loop_count"
#     param_2_value="1"

#     param_3_name="id"
#     param_3_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl
# done

# echo "#########################"

# echo "Running tests for dbhttp"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_dbhttp_${t}.jtl

#     request_path="microbenchmark/dbhttp"

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


# echo "Running tests for http_2_db"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_http_2_db_${t}.jtl

#     request_path="microbenchmark/loophttploopdb"

#     param_1_name="db_loop_count"
#     param_1_value="1"

#     param_2_name="http_loop_count"
#     param_2_value="2"

#     param_3_name="id"
#     param_3_value="1"

#     echo ${filename}

#     ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
#     sleep ${sleep_duration}
#     ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

#     rm -f *warmup.jtl
#     rm -f *measurement.jtl 
# done

# echo "#########################"


# echo "Running tests for httpcpu_large"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_httpcpu_large_${t}.jtl

#     request_path="microbenchmark/httpcpu"

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


# echo "Running tests for httpcpu_small"

# for t in ${allThreads[@]}; do

#     filename=results_${POOL_SIZE}_httpcpu_small_${t}.jtl

#     request_path="microbenchmark/httpcpu"

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


echo "Running tests for db_1_http_2"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_db_1_http_2_${t}.jtl

    request_path="microbenchmark/loopdbloophttp"

    param_1_name="db_loop_count"
    param_1_value="1"

    param_2_name="http_loop_count"
    param_2_value="2"

    param_3_name="id"
    param_3_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"


echo "Running tests for db_1_http_1"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_db_1_http_1_${t}.jtl

    request_path="microbenchmark/loopdbloophttp"

    param_1_name="db_loop_count"
    param_1_value="1"

    param_2_name="http_loop_count"
    param_2_value="1"

    param_3_name="id"
    param_3_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"


echo "Running tests for http_1"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_http_1_${t}.jtl

    request_path="microbenchmark/loophttploopdb"

    param_1_name="db_loop_count"
    param_1_value="0"

    param_2_name="http_loop_count"
    param_2_value="1"

    param_3_name="id"
    param_3_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for http_2"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_http_2_${t}.jtl

    request_path="microbenchmark/loophttploopdb"

    param_1_name="db_loop_count"
    param_1_value="0"

    param_2_name="http_loop_count"
    param_2_value="2"

    param_3_name="id"
    param_3_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"

echo "Running tests for http_3"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_http_3_${t}.jtl

    request_path="microbenchmark/loophttploopdb"

    param_1_name="db_loop_count"
    param_1_value="0"

    param_2_name="http_loop_count"
    param_2_value="3"

    param_3_name="id"
    param_3_value="1"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"


echo "Running tests for http_2_db_1"

for t in ${allThreads[@]}; do

    filename=results_${POOL_SIZE}_http_3_${t}.jtl

    request_path="microbenchmark/loophttploopdb"

    param_1_name="db_loop_count"
    param_1_value="1"

    param_2_name="http_loop_count"
    param_2_value="3"

    param_3_name="id"
    param_3_value="2"

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_General_4_params.jmx -Jrequest_path=${request_path} -Jparam_1_name=${param_1_name} -Jparam_1_value=${param_1_value} -Jparam_2_name=${param_2_name} -Jparam_2_value=${param_2_value} -Jparam_3_name=${param_3_name} -Jparam_3_value=${param_3_value} -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}

    rm -f *warmup.jtl
    rm -f *measurement.jtl
done

echo "#########################"
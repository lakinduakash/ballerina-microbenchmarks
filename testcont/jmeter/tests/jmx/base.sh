#!/usr/bin/env bash

#Set duration
duration=900 # 15 minutes
ramp_time=1

split_time=300

sleep_duration=5

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"

allThreads=(1 20 40 80 150 400)

echo "Running tests for Is Prime 406423"
prime=406423

for t in ${allThreads[@]}; do

    filename=results_is_prime_small_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}
done

echo "#########################"

echo "Running tests for Is Prime 10674959"
prime=10674959

for t in ${allThreads[@]}; do

    filename=results_is_prime_large_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}
done

echo "#########################"

echo "Running tests for file io"

for t in ${allThreads[@]}; do

    filename=results_file_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}
done


echo "#########################"

echo "Running tests for merge_sort"

for t in ${allThreads[@]}; do

    filename=results_merge_sort_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Merge_Sort.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}
done

echo "#########################"

echo "Running tests for db select"

for t in ${allThreads[@]}; do

    filename=results_db_select_${t}.jtl

    echo ${filename}

    ${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Db_Select.jmx -Jthreads=${t} -Jduration=${duration} -Jramp_time=${ramp_time} -l ${filename}
    sleep ${sleep_duration}
    ${jtl_splitter} -f ${filename} -s -u SECONDS -t ${split_time}
done

echo "#########################"
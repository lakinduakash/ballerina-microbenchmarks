#!/usr/bin/env bash

#Set duration
duration=900 # 15 minutes
ramp_time=1

split_time=300

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.3/bin/jmeter"


# Is Prime

echo "Running tests for Is Prime 406423"
prime=406423

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_1.jtl
sleep 5
${jtl_splitter} -f esults_file_1.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=10 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_10.jtl
sleep 5
${jtl_splitter} -f esults_file_10.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=40 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_40.jtl
sleep 5
${jtl_splitter} -f esults_file_40.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=80 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_80.jtl
sleep 5
${jtl_splitter} -f esults_file_80.jtl -s -u SECONDS -t ${split_time}


echo "#########################"

echo "Running tests for Is Prime 10674959"
prime=10674959

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_1.jtl
sleep 5
${jtl_splitter} -f esults_file_1.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=10 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_10.jtl
sleep 5
${jtl_splitter} -f esults_file_10.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=40 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_40.jtl
sleep 5
${jtl_splitter} -f esults_file_40.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Is_Prime.jmx -Jthreads=80 -Jduration=${duration} -Jramp_time=${ramp_time} -Jparam_number=${prime} -l esults_file_80.jtl
sleep 5
${jtl_splitter} -f esults_file_80.jtl -s -u SECONDS -t ${split_time}

echo "#########################"

echo "Running File tests"

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_1.jtl
sleep 5
${jtl_splitter} -f results_file_1.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=10 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_10.jtl
sleep 5
${jtl_splitter} -f results_file_10.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=40 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_40.jtl
sleep 5
${jtl_splitter} -f results_file_40.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=80 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_80.jtl
sleep 5
${jtl_splitter} -f results_file_80.jtl -s -u SECONDS -t ${split_time}


echo "#########################"

echo "Running Merger sort"

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Merge_Sort.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_merge_sort_1.jtl
sleep 5
${jtl_splitter} -f results_merge_sort_1.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Merge_Sort.jmx -Jthreads=10 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_merge_sort_10.jtl
sleep 5
${jtl_splitter} -f results_merge_sort_10.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Merge_Sort.jmx -Jthreads=40 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_merge_sort_40.jtl
sleep 5
${jtl_splitter} -f results_merge_sort_40.jtl -s -u SECONDS -t ${split_time}

${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Merge_Sort.jmx -Jthreads=80 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_merge_sort_80.jtl
sleep 5
${jtl_splitter} -f results_merge_sort_80.jtl -s -u SECONDS -t ${split_time}




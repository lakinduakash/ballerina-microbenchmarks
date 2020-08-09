#!/usr/bin/env bash

#Set duration
duration=1800 # 30 minutes
ramp_time=0

split_time=600

jtl_splitter="java -jar /usr/share/jtl-splitter-0.4.5.jar"
jmeter="/usr/share/apache-jmeter-5.2.1/bin/jmeter"

# Threads 1
echo "Running tests for 1 thread"
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_1.jtl
sleep 5
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_cpu_1.jtl
sleep 5
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_memory_1.jtl
sleep 5
#${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_io_1.jtl

echo "Generating summaries"
${jtl_splitter} -f results_file_1.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_cpu_1.jtl.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_memory_1.jtl -s -u SECONDS -t ${split_time}
#${jtl_splitter} -f results_io_1.jtl -s -u SECONDS -t ${split_time}
echo "#########################"

# Threads 5
echo "Running tests for 5 threads"
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_5.jtl
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_cpu_5.jtl
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_memory_5.jtl
#${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_io_5.jtl

echo "Generating summaries"
${jtl_splitter} -f results_file_5.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_cpu_5.jtl.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_memory_5.jtl -s -u SECONDS -t ${split_time}
#${jtl_splitter} -f results_io_5.jtl -s -u SECONDS -t ${split_time}
echo "#########################"

# Threads 20
echo "Running tests for 20 threads"
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_file_20.jtl
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_cpu_20.jtl
${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_memory_20.jtl
#${jmeter} --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=${ramp_time} -l results_io_20.jtl

echo "Generating summaries"
${jtl_splitter} -f results_file_20.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_cpu_20.jtl.jtl -s -u SECONDS -t ${split_time}
${jtl_splitter} -f results_memory_20.jtl -s -u SECONDS -t ${split_time}
#${jtl_splitter} -f results_io_20.jtl -s -u SECONDS -t ${split_time}
echo "#########################"

#tar -czf results_$(date +'%Y%m%d_%H%M%S').tar.gz *

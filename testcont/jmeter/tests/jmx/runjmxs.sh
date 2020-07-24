#!/usr/bin/env bash

duration=1800


# Threads 1
echo "Running tests for 1 thread"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=3 -l results_file_1.jtl -e -o "reports_file_1"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=3 -l results_cpu_1.jtl -e -o "reports_cpu_1"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=3 -l results_memory_1.jtl -e -o "reports_memory_1"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -Jthreads=1 -Jduration=${duration} -Jramp_time=3 -l results_io_1.jtl -e -o "reports_io_1"
echo "#########################"

# Threads 5
echo "Running tests for 5 threads"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=3 -l results_file_5.jtl -e -o "reports_file_5"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=3 -l results_cpu_5.jtl -e -o "reports_cpu_5"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=3 -l results_memory_5.jtl -e -o "reports_memory_5"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -Jthreads=5 -Jduration=${duration} -Jramp_time=3 -l results_io_5.jtl -e -o "reports_io_5"
echo "#########################"

# Threads 20
echo "Running tests for 20 threads"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=3 -l results_file_20.jtl -e -o "reports_file_20"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=3 -l results_cpu_20.jtl -e -o "reports_cpu_20"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=3 -l results_memory_20.jtl -e -o "reports_memory_20"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -Jthreads=20 -Jduration=${duration} -Jramp_time=3 -l results_io_20.jtl -e -o "reports_io_20"
echo "#########################"

tar -czf results_$(date +'%Y%m%d_%H%M%S').tar.gz *

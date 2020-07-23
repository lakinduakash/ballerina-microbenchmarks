#!/usr/bin/env bash

# Threads 1
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=1 -Jduration=10 -l results_file_1.jtl -e -o "reports_file_1"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=1 -Jduration=10 -l results_cpu_1.jtl -e -o "reports_cpu_1"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=1 -Jduration=10 -l results_memory_1.jtl -e -o "reports_memory_1"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -Jthreads=1 -Jduration=10 -l results_io_1.jtl -e -o "reports_io_1"

# Threads 5
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=5 -Jduration=10 -l results_file_5.jtl -e -o "reports_file_5"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=5 -Jduration=10 -l results_cpu_5.jtl -e -o "reports_cpu_5"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=5 -Jduration=10 -l results_memory_5.jtl -e -o "reports_memory_5"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -Jthreads=5 -Jduration=10 -l results_io_5.jtl -e -o "reports_io_5"

# Threads 20
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File.jmx -Jthreads=20 -Jduration=10 -l results_file_20.jtl -e -o "reports_file_20"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU.jmx -Jthreads=20 -Jduration=10 -l results_cpu_20.jtl -e -o "reports_cpu_20"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory.jmx -Jthreads=20 -Jduration=10 -l results_memory_20.jtl -e -o "reports_memory_20"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -Jthreads=20 -Jduration=10 -l results_io_20.jtl -e -o "reports_io_20"

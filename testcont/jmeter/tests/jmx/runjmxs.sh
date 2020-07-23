#!/usr/bin/env bash

/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_File_5.jmx -l results_file_5.jtl -e -o "reports_file_5"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_CPU_5.jmx -l results_cpu_5.jtl -e -o "reports_cpu_5"
/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_Memory_5.jmx -l results_memory_5.jtl -e -o "reports_memory_5"
#/usr/share/apache-jmeter-5.2.1/bin/jmeter --forceDeleteResultFile -n -t /usr/tests/jmx/Test_Plan_IO_5.jmx -l results_io_5.jtl -e -o "reports_io_5"

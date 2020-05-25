FROM openjdk:8
COPY apache-jmeter-5.2.1 /usr/share/apache-jmeter-5.2.1
WORKDIR /usr/tests/results
CMD ["/usr/share/apache-jmeter-5.2.1/bin/jmeter","-n","-t", "/usr/tests/jmx/Test_Plan_for_Bal_Microbenchmarks.jmx","-l","resultstestresults.jtl"]

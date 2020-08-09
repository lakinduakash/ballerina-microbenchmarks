FROM openjdk:8
COPY apache-jmeter-5.2.1 /usr/share/apache-jmeter-5.2.1
COPY jtl-splitter-0.4.5.jar /usr/share/jtl-splitter-0.4.5.jar
WORKDIR /usr/tests/results
CMD ["sh","/usr/tests/jmx/runjmxs.sh"]

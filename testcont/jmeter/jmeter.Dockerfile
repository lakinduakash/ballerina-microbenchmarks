FROM openjdk:8
COPY apache-jmeter-5.2.1 /usr/share/apache-jmeter-5.2.1
WORKDIR /usr/tests/results
CMD ["sh","/usr/tests/jmx/runjmxs.sh"]

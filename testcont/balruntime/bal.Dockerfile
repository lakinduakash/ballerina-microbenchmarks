FROM openjdk:8
COPY jballerina-tools-1.3.0-SNAPSHOT /usr/ballerina/jballerina-tools-1.3.0-SNAPSHOT
COPY benchmarks /usr/benchmarks
WORKDIR /usr/benchmarks
CMD ["/usr/ballerina/jballerina-tools-1.3.0-SNAPSHOT/bin/ballerina","run", "microbenchmark.bal"]
EXPOSE 9090

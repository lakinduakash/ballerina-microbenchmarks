# Ballerina benchmarks

### Setup ballerina server
To build and run ballerina server execute `setup.sh`. 

**Before run, add ballerina binaries to `testcont/balruntime/jballerina-*`**

### setup jmeter

To execute jmeter tests run `setup-jmeter.sh`. 
Jmx files are located in `testcont/jmeter/tests/jmx`. Results are writen to `testcont/jmeter/tests/results`

**Note:** Copy extracted `apache-jmeter-5.2.1` to `testcont/jmeter/`.
`tests` folder is mounted into docker container.



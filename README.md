# Ballerina benchmarks

### Setup ballerina server
To build and run ballerina server execute `setup.sh`. 

**Before run, add ballerina binaries to `testcont/balruntime/jballerina-*`**

### setup jmeter

To execute jmeter tests run `setup-jmeter.sh`. 
Jmx files are located in `testcont/jmeter/tests/jmx`. Results are writen to `testcont/jmeter/tests/results`

**Note:** Copy extracted `apache-jmeter-5.3` to `testcont/jmeter/`.
`tests` folder is mounted into docker container.

Download Jmeter

`wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.3.tgz && tar -xf tests/jmeter/`

`./gradlew clean --no-build-cache build -x test -x :composer-library:npmBuild -x :testerina:report-tools:updateVersion -x :testerina:report-tools:npmInstall -x check -x generateDocs -x :testerina:report-tools:npmBuild  -x npmBuild --stacktrace`


Copy ballerina runtime

`cp -r ~/common-projects/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-2.0.0-SNAPSHOT ~/common-projects/ballerina-microbenchmarks-master/testcont/balruntime/jballerina-tools-2.0.0-SNAPSHOT`

`rm -rf ~/project/ballerina-microbenchmarks/testcont/balruntime/jballerina-tools-2.0.0-SNAPSHOT`

`cp -fr --remove-destination ~/project/ballerina-lang/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-2.0.0-SNAPSHOT ~/project/ballerina-microbenchmarks/testcont/balruntime/jballerina-tools-2.0.0-SNAPSHOT`

Background script 

`nohup myprogram > foo.out 2> foo.err < /dev/null &`
#!/usr/bin/env bash
# cp *.bal testcont/balruntime/benchmarks/
# cp -r files testcont/balruntime/benchmarks/

# cd testcont/balruntime
# docker build . -t bal-benchmark -f bal.Dockerfile
# docker rm bal-benchmark-cont
# docker run --name bal-benchmark-cont -p 9090:9090 --cpus="0.7" -d bal-benchmark

# Start mysql-server
docker stop my-mysql-benchmark 2>/dev/null
docker rm my-mysql-benchmark 2>/dev/null
docker run --name my-mysql-benchmark -e MYSQL_ROOT_PASSWORD=root@123 -p 3306:3306 -d mysql

echo "mysql server starting..."

sql_query="create database testdb;
create table testdb.emp
(
    id        int auto_increment
        primary key,
    firstName varchar(100) null
);

INSERT INTO testdb.emp (id, firstName) VALUES (1, 'Lakindu Akash');"

while ! docker exec -it my-mysql-benchmark mysql -u root -proot@123  -e "${sql_query}" &>/dev/null; do
       sleep 0.1
done

echo "mysql server started"

# Download mysql-conector
if [ ! -f new_tests/benchmark/jar/mysql-connector-java-8.0.19.jar ]; then
    wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar -O new_tests/benchmark/jar/mysql-connector-java-8.0.19.jar
fi

cp -rf new_tests/benchmark testcont/balruntime/benchmark
cd testcont/balruntime
docker build . -t bal-benchmark -f bal.Dockerfile
docker stop bal-benchmark-cont 2>/dev/null
docker rm bal-benchmark-cont 2>/dev/null
docker run --name bal-benchmark-cont --net="host" -p 9090:9090 --cpus="1" --memory="2g" bal-benchmark

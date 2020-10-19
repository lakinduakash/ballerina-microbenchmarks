FROM openjdk:8
COPY Main.java /usr/test/Main.java
WORKDIR /usr/test/
RUN ["javac","Main.java"]
CMD ["java Main"]
EXPOSE 9090

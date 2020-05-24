FROM openjdk:8
# Add jemeter
CMD ["jemeter","run", "my.jmx"]

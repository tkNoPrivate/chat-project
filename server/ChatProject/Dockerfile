FROM maven:3.8.6 AS builder
WORKDIR /tmp
COPY ./src ./src
COPY ./pom.xml .
RUN mvn package -Dmaven.test.skip=true
FROM openjdk:17-alpine
COPY --from=builder /tmp/target/ChatProject-0.0.1-SNAPSHOT.jar /ChatProject-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/ChatProject-0.0.1-SNAPSHOT.jar"]
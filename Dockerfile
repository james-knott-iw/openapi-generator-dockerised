FROM eclipse-temurin:17-jdk-focal


COPY /target/openapi-0.0.1-SNAPSHOT.jar openapi-0.0.1.jar

ENTRYPOINT ["java","-jar","/openapi-0.0.1.jar"]
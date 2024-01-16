# Open API Generator

This repo contains a Spring Boot application which generates the code for an API using the Open API generator. The generated code is generated based on the schemas specified in YAML files. We are using [CurrentAccount.yaml](\src\main\resources\CurrentAccount.yaml)

## Prerequisites

- Java JDK 17+
- Docker
- Clone the repository locally.

## Generating the API

Enter the cloned repository and within the root of the cloned repository run the following command:

```bash
mvn clean install
```

This will generate the code for the Spring Boot API within the [`/target/generated-sources/openapi`](/target/generated-sources/openapi/). There is also a `.jar` file which is generated within the `/target` directory called `openapi-0.0.1-SNAPSHOT.jar`.This will be used to run the API on a Docker container.

## Build Docker Image

Next we build a Docker image based on the [Dockerfile](Dockerfile). This Dockerfile copies over the `.jar` of our Spring Boot API to the container and runs it.

```bash
docker build -t openapi-gen:latest .
```

## Run Dockerised API

Next we can run an instance of the newly created `openapi-gen:latest` image.

```bash
docker run -p 8080:8080 openapi-gen:latest
```

## Test Dockerised API

Make a curl request to the API to verify it is running.

```bash
curl -X POST http://localhost:8080
```

You should receive a `404 Not Found` response. This signifies that API is running but as the API is just a stub you will not get successful responses.
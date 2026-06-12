FROM maven:3.9.9-eclipse-temurin-21
COPY pom.xml .
RUN  mvn dependency:go-offline -B
COPY src ./src
COPY data /app/data
RUN mvn package -DskipTests
ENV APP_DATA_PATH=/app/data/
EXPOSE 8080 
CMD ["java","-jar","target/mundial2026-0.0.1-SNAPSHOT.jar"]

FROM maven:3.9.9-eclipse-temurin-21
WORKDIR /app
COPY pom.xml .
RUN  mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests
COPY data/jugadores.json .
COPY data/grupos.json .
ENV APP_DATA_PATH=data
EXPOSE 8080 
CMD ["java","-jar","target/mundial2026-0.0.1-SNAPSHOT.jar"]

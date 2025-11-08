FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Copy Maven files
COPY pom.xml .
COPY src ./src

# Install Maven and build project
RUN apt-get update && apt-get install -y maven && mvn clean package -DskipTests

# 👇 Replace this wrong line
# COPY target/*.jar app.jar

# 👇 With this correct line
RUN cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

FROM openjdk:17-jdk-slim as build

WORKDIR /opt/user

COPY mvnw .
RUN chmod +x mvnw
COPY .mvn .mvn
COPY pom.xml .
RUN ./mvnw dependency:resolve
COPY src src
RUN ./mvnw package -DskipTests

FROM openjdk:17-jdk-slim

EXPOSE 8080

WORKDIR /opt/user

COPY --from=build /opt/user/target/user-*.jar user.jar

CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "user.jar" ]
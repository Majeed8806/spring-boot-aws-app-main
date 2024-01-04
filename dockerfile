FROM maven:3.8.4 as build
WORKDIR /app
COPY . .
RUN mvn clean install -Dmaven.test.skip=true

FROM anapsix/alpine-java
WORKDIR /app
COPY --from=build /app/target/*.jar /app/
EXPOSE 9090
CMD {"java","-jar","*.jar"}


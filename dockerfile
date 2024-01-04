FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install



FROM anapsix/alpine-java
WORKDIR /app
COPY --from=build /app/target/*.jar /app/
EXPOSE 9090
CMD {"java","-jar","*.jar"}


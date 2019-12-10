FROM alpine:latest
COPY target/[server].jar
ENV PROFILE=[profile]
CMD java -jar -Dspring.profiles.active=$PROFILE [server].jar
EXPOSE 8761


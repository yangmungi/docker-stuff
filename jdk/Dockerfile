FROM debian:stable-slim

COPY / /jdk
RUN ln -s /jdk/bin/java /usr/bin/java

ENTRYPOINT ["java"]

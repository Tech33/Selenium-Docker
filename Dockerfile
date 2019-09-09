FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host
# into this image
ADD HybridFramework-0.0.1-SNAPSHOT-jar-with-dependencies.jar HybridFramework-0.0.1-SNAPSHOT-jar-with-dependencies.jar
ADD HybridFramework-0.0.1-SNAPSHOT.jar HybridFramework-0.0.1-SNAPSHOT.jar

# ADD health check script
# ADD healthcheck.sh                      healthcheck.sh
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=11LTnb9ScVMj8sP1MfOpqXLyXLzOp8RYt' -O healthcheck.sh

# in case of any other dependency like .csv / .json / .xls
# please ADD that as well

COPY resources resources
COPY src  src
COPY drivers drivers

ADD testng_surefire_4.xml testng_surefire_4.xml
ADD testng_surefire_8.xml testng_surefire_8.xml

# ENTRYPOINT java -jar HybridFramework-0.0.1-SNAPSHOT-jar-with-dependencies.jar $HUB_HOST $TESTNG_FILE $BROWSER

ENTRYPOINT sh healthcheck.sh
#!/usr/bin/env bash
# Environment Variables
# HUB_HOST
# BROWSER
# MODULE

sleep 15
echo "Checking if hub is ready"
echo "Checking if hub is ready - $HUB_HOST"
while [ "$( curl -s http://$HUB_HOST:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
do
	sleep 1
done
echo "Checking Complete....."

# start the java command
java -jar HybridFramework-0.0.1-SNAPSHOT-jar-with-dependencies.jar $HUB_HOST $TESTNG_FILE $BROWSER
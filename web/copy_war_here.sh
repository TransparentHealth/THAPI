#!/usr/bin/env bash
# Copy war file

# Get directory this script is in..
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo Copying .war to $DIR
cp $DIR/../hapi-fhir/hapi-fhir-jpaserver-example/target/hapi-fhir-jpaserver-example.war $DIR

ls $DIR

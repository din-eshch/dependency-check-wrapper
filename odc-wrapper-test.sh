#!/bin/sh

SUPPRESSION_FILE="$PWD/dependencycheck-base-suppression.xml"
APP_NAME="odc-test-scan"
REPORT_DIRECTORY="$PWD/build/reports"

if [ ! -d "$REPORT_DIRECTORY" ]; then
    echo "Initially creating persistent REPORT directory"
    mkdir -p "$REPORT_DIRECTORY"
    chmod -R 777 "$REPORT_DIRECTORY"
fi

echo "Pulling Container Image to Test"
docker pull dependency-check-wrapper:latest

echo "Running OWASP Dependency Check"
docker run --rm \
    --volume "$PWD/testdata":/src \
    --volume "$REPORT_DIRECTORY":/report \
    dependency-check-wrapper \
    --project "$APP_NAME" \
    --suppression "$SUPPRESSION_FILE" \
    --log "$REPORT_DIRECTORY/ODC.log"

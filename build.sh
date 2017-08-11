#!/bin/bash

set -e -x
./sysmaster-web-git/mvnw clean package
cp sysmaster-web-gite/target/concourse-maven-cf-simple-0.0.1-SNAPSHOT.jar  build-output/.

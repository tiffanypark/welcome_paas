#!/bin/bash

set -e -x

pushd sysmaster-web-git
  ./mvnw clean package
popd

cp sysmaster-web-gite/target/concourse-maven-cf-simple-0.0.1-SNAPSHOT.jar  build-output/.

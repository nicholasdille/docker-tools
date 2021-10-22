#!/bin/bash

for DIR in $(find . -type f -name Dockerfile | cut -d/ -f2); do
    echo "### Found ${DIR}"
    cat >>jobs.yml <<EOF
${DIR}:
  stage: build
  rules:
  - changes:
    - generate.sh
    - jobs.yml
    - ${DIR}/Dockerfile
  extends: .docker-build
  variables:
    DIR: ${DIR}
    IMAGE_TAG: ${DIR}
EOF
done

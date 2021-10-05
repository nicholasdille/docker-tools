#!/bin/bash
set -o errexit

docker build --tag "nicholadille/tools:base" @base

FILES="$(find . -mindepth 2 -type f -name Dockerfile | grep -v "/@" | sort)"
for FILE in ${FILES}; do
    echo "### Processing ${FILE}"
    TOOL="$(basename "$(dirname "${FILE}")")"
    echo "    Using tool ${TOOL}"
    docker build --tag "nicholasdille/tools:${TOOL}" "${TOOL}"
done

docker build --tag "nicholadille/tools:latest" @final
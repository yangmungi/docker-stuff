#!/bin/bash

NPM_VERSION=${NPM_VERSION:-11.6.0}

docker pull node:23

for subdirectory in openai-codex opencode-ai
do
        (
                cd $subdirectory
                docker build --progress plain -t ymdc/$subdirectory .
        )
done

docker pull "debian:trixie"

for subdirectory in claude-code ai-cli
do
        (
                cd $subdirectory
                docker build --progress plain -t ymdc/$subdirectory .
        )
done

docker pull "python:3.12"

(
        cd marimo
        docker build --progress plain -t ymdc/marimo .
)

# probably best to just check for condaforge/miniforge3

(
        cd jupyter
        docker build --progress plain --target jupyter -t ymdc/jupyter-ai .
)

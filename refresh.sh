#!/bin/bash

NODE_VERSION=${NODE_VERSION:-23}
NPM_VERSION=${NPM_VERSION:-11.6.0}

docker pull node:$NODE_VERSION

for subdirectory in claude-code openai-codex opencode-ai
do
        (
                cd $subdirectory
                docker build --progress plain -t ymdc/$subdirectory .
        )
done

(
        cd marimo
        docker build --progress plain -t ymdc/marimo .
)

(
        cd jupyter
        docker build --progress plain --target jupyter -t ymdc/jupyter-ai .
)

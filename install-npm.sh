#!/usr/bin/env bash

for p in `jq -r '.[]' /gdc-hubot/external-scripts.json`; do
    npm install --save $p
done

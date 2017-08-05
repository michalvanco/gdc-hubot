#!/usr/bin/env bash

for p in `jq -r '.[]' external-scripts.json`; do
    npm install --save p
done

#!/bin/bash

cd ./scripts
nohup node index.js &

cd ..
cd ./run
conflux --config ./default.toml
# node scripts/index.js
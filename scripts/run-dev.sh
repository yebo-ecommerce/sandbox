#!/bin/bash

docker run --rm -ti \
  -e EMBER_ENV=development \
  -w /current \
  -v $(pwd):/current \
  -p 4200:4200 -p 49152:49152 -p 80:80 \
  sandbox scripts/inside-container.sh $1

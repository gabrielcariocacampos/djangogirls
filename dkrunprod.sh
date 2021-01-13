#!/bin/bash

docker build -t gabrielcarioca .
docker stop gabrielcarioca
docker run -d --rm -p 8000:8000 \
    --env-file $HOME/gabrielcarioca.env \
    --name gabrielcarioca \
    -v $(pwd)/dkdata:/dkdata \
    gabrielcarioca start.sh

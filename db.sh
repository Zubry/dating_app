#!/bin/bash

docker network create dating-app-network
docker run --network dating-app-network --name=riak -d -p 8087:8087 -p 8098:8098 basho/riak-kv

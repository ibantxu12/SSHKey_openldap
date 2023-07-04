#!/bin/bash

docker volume create web_data
docker volume create db_data


docker-compose up -d

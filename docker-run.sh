#!/bin/bash
docker build -t reservation . -f Dockerfile
docker run --rm -it -p 80:3000 reservation

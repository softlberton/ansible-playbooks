#!/bin/bash

# Delete docker data

docker system prune -a --volumes -f

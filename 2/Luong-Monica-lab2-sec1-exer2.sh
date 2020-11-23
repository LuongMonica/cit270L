#!/bin/sh
FULL_PATH=$1
find ${FULL_PATH} -type f -size +100M 

#!/usr/bin/env bash

. $(dirname $0)/replacevars

input="Hi {{first}} {{last}}"

first=Some
last=Person

# Prints "Hi Some Person"
echo "$input" | replacevars -

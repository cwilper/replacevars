#!/usr/bin/env bash

. $(dirname $0)/replacevars

input="Hi {{first}} {{last}}"

first=Some
last=Person

# Prints "Hi Some Person"
echo "$input" | replacevars -

# Fails due to undefined variable and exits with code 42
echo "{{meaning_of_life}}" | replacevars - || exit 42

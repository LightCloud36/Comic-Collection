#!/bin/bash

curl --include --request GET "http://localhost:4741/comics/${ID}" \
    --header "Authorization: Token token=${TOKEN}"\
    --data '{}'
echo

#!/bin/bash

curl --include --request POST 'http://localhost:4741/comics' \
  --header "Content-Type: application/json" \
  --data '{
    "comic": {
      "issue": "'"${ISSUE}"'",
      "title": "'"${TITLE}"'"
    }
  }'

  echo

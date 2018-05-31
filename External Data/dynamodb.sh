#!/bin/bash

aws dynamodb create-table --table-name FortuneList --attribute-definitions AttributeName=FortuneID,AttributeType=S --key-schema AttributeName=FortuneID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

aws dynamodb wait table-exists --table-name FortuneList

aws dynamodb put-item --table-name FortuneList --item file://item.json

aws dynamodb batch-write-item --request-items file://items.json

aws dynamodb get-item --table-name FortuneList --key file://key.json

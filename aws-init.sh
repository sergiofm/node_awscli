#!/bin/bash -e

if [ -z $AWS_ACCESS_KEY_ID ];then
  echo "Please set the environment variable AWS_ACCESS_KEY_ID in your repository settings (Settings/Pipelines/Environment Variables)"
  exit 1
fi
if [ -z $AWS_SECRET_ACCESS_KEY ];then
  echo "Please set the environment variable AWS_SECRET_ACCESS_KEY in your repository settings (Settings/Pipelines/Environment Variables)"
  exit 1
fi

mkdir -p ~/.aws
printf "[profile aws-cli]
aws_access_key_id = %s
aws_secret_access_key = %s
" $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY > ~/.aws/config
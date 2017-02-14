#!/bin/bash

BUCKET_NAME="alexa-rain-drop"

aws cloudformation create-stack \
	--stack-name AlexaRainDrop \
	--template-body file://cfn-setup.yml \
	--capabilities CAPABILITY_IAM \
	--on-failure DO_NOTHING \
	--parameters ParameterKey=S3BucketName,ParameterValue=${BUCKET_NAME}

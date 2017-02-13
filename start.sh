#!/bin/bash
aws cloudformation create-stack \
	--stack-name AlexaRainDrop \
	--template-body file://cfn-setup.yml \
	--capabilities CAPABILITY_IAM \
	--on-failure DO_NOTHING

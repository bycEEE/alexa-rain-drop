#!/bin/bash
set -e
source config.env

# Create setup stack
aws cloudformation create-stack \
	--stack-name AlexaRainDropSetup \
	--template-body file://cfn-setup.yml \
	--capabilities CAPABILITY_IAM \
	--on-failure DO_NOTHING \
	--parameters ParameterKey=S3BucketName,ParameterValue=$BUCKET_NAME

# Wait until setup stack is created
echo Waiting for CloudFormation stack to finish creating
aws cloudformation wait stack-create-complete --stack-name AlexaRainDropSetup

# Remove existing archives and create new ones
rm -rf $RAIN_DROP_FILE $BAD_BOUJEE_FILE
zip -9j $RAIN_DROP_FILE src/raindrop.py
#zip -9 $BAD_BOUJEE_FILE src/badboujee.py

# Upload files to s3
aws s3 cp $RAIN_DROP_FILE s3://$BUCKET_NAME

# Replace bucket names in yml template
sed -i '' -e "s/BUCKET_NAME/$BUCKET_NAME/g" cfn-function.yml

# Create function stack
aws cloudformation create-stack \
	--stack-name AlexaRainDropFunction \
	--template-body file://cfn-function.yml \
	--capabilities CAPABILITY_IAM \
	--on-failure DO_NOTHING \


#!/bin/bash
set -e
source config.env

# Creoate setup stack
echo Creating setup CloudFormation stack
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
echo Creating archives to upload to s3
rm -rf $RAIN_DROP_FILE $BAD_BOUJEE_FILE
zip -9j $RAIN_DROP_FILE src/raindrop.py
zip -9j $BAD_BOUJEE_FILE src/badboujee.py

# Upload files to s3
echo Uploading to s3
aws s3 cp $RAIN_DROP_FILE s3://$BUCKET_NAME
aws s3 cp $BAD_BOUJEE_FILE s3://$BUCKET_NAME

# Create function stack
echo Creating function CloudFormation stack
aws cloudformation create-stack \
	--stack-name AlexaRainDropFunctions \
	--template-body file://cfn-function.yml \
	--capabilities CAPABILITY_IAM \
	--on-failure DO_NOTHING \

# Wait until setup stack is created
echo Waiting for CloudFormation stack to finish creating
aws cloudformation wait stack-create-complete --stack-name AlexaRainDropFunctions

# Cleanup
echo Removing zip files
rm $RAIN_DROP_FILE $BAD_BOUJEE_FILE

echo "Done!"

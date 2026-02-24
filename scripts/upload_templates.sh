#!/bin/bash

BUCKET_NAME="dynamodb-stream-cfn-bucket"

echo "Step 1: Validating CloudFormation Templates..."
aws cloudformation validate-template --template-body file://dynamodb-stream-cf/cloudformation/root.yaml

echo "Step 2: Syncing componets to s3 ..."
aws s3 sync ./dynamodb-stream-cf/cloudformation/componets/ s3://dynamodb-stream-cfn-bucket/templates/

echo "Step 3: Syncing root Template to S3..."
aws s3 cp ./dynamodb-stream-cf/cloudformation/root.yaml s3://dynamodb-stream-cfn-bucket/root.yaml

echo "Done! Temlates are ready for deployment. make sure to run the script from home directory"
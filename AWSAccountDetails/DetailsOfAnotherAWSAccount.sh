#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <profile_name> <access_key_id> <secret_access_key> <region>"
    echo "profile_name: The profile name to use for configuring AWS CLI"
    echo "access_key_id: The Access Key ID of the AWS account"
    echo "secret_access_key: The Secret Access Key of the AWS account"
    echo "region: The AWS region to use"
    exit 1
}

# Check if all required parameters are provided
if [ $# -ne 4 ]; then
    usage
fi

profile_name=$1
access_key_id=$2
secret_access_key=$3
region=$4

# Configure AWS CLI with the provided credentials and region
aws configure set aws_access_key_id $access_key_id --profile $profile_name
aws configure set aws_secret_access_key $secret_access_key --profile $profile_name
aws configure set region $region --profile $profile_name

# Check if configuration was successful
if [ $? -ne 0 ]; then
    echo "Error: AWS CLI configuration failed"
    exit 1
fi

echo "AWS CLI configured successfully with profile: $profile_name"

# Retrieve EC2 instance details
echo "EC2 Instances:"
aws ec2 describe-instances --profile $profile_name

# Retrieve IAM user details
echo "IAM Users:"
aws iam list-users --profile $profile_name

# Retrieve S3 bucket details
echo "S3 Buckets:"
aws s3 ls --profile $profile_name


#!/bin/bash

################
# Author: Mithun Gowda
# Date: 05-03-2024
# Version: v1
#
# This script is to create a EC2 Instance
#
################


# AWS region
region="us-east-1"

# EC2 instance details
instance_type="t2.micro"
ami_id="ami-0440d3b780d96b29d" # Replace this with your desired AMI ID
key_name="My_KeyPair"        # Replace this with your key pair name
security_group_id="sg-0552f4a27ea4bc5d9" # Replace this with your security group ID
subnet_id="subnet-09febc687bb5208e0"
tag_specifications="ResourceType=instance,Tags=[{Key=Name,Value=myInstance}]"

# Launching the EC2 instance
instance_id=$(aws ec2 run-instances \
  --region $region \
  --image-id $ami_id \
  --instance-type $instance_type \
  --key-name $key_name \
  --security-group-ids $security_group_id \
  --subnet-id $subnet_id \
  --tag-specifications $tag_specifications \
  --query 'Instances[0].InstanceId' \
  --output text)

# Check if instance creation was successful
if [ -n "$instance_id" ]; then
  echo "EC2 instance created successfully with ID: $instance_id"
else
  echo "Failed to create EC2 instance"
  exit 1
fi


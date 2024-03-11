#!/bin/bash

######################
#Author: Mithun Gowda
#Date: 11-03-2024
#Version: v1
#
# This script will gather AWS resource usage deatils and save them to .txt file
# It sets cron job to run this script every day at 6:00 PM
# This script use the default AWS CLI profile specified in the '~/.aws/credentials'
# To check manually cd ~/.aws ---> ls ---> nano credentials
#
######################




set -x
set -o
set -e



# Output file

OUTPUT_FILE="resourceTracker_$(date +'%Y%m%d').txt"


#AWS CLI command to get resource usage details
aws cloudwatch list-metrics > $OUTPUT_FILE


# You can add more commands to gather specific resource usage details using the AWS CLI here

echo "Resource usage details saved to $OUTPUT_FILE"


# In terminal setup crontab ---> crontab -e and then add below line
# 0 18 * * * /bin/bash /path/to/resourceTracker.sh

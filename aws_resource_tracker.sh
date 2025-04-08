#!/bin/bash

############################
# Author: Tejas Kedare
# Date: 8th April 2025
#
# Version: v1
#
# About
# This Script will report the AWS resource usage
############################

set -x # Debugs the script showing us the commands that are getting executed.
set 

set -o # Handles teh pipefail command

set -e # Exits the code if there is an error

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# List S3 Buckets
echo "Print List of s3 buckets"
aws s3 ls

# List EC2 Instances
echo "Print List of ec2 instances"
aws ec2 describe-instances

# List Lambda Functions
echo "Print List of lambda functions"
aws lambda list-functions

# List IAM Users
echo "Print List of IAM Users"	
aws iam list-users

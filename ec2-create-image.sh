#!/usr/bin/env bash

#
# @Purpose 		Creates an image (AMI) of the given EC2 instance
# @Background 	Meant to be run as a cronjob. Requires that awscli is installed. Assumes that the 
# instance running this command has the permission ec2:CreateImage assigned via IAM.
#
# @Usage: 		ec2-create-image <instance-id>
#

DATE=$(date +%Y-%m-%d_%H-%M) 
AMI_NAME="Wordpress Backup - $DATE"
AMI_DESCRIPTION="Wordpress Backup - $DATE"
INSTANCE_ID=$1

printf "Requesting AMI for instance $1...\n"
aws ec2 create-image --instance-id $1 --name "$AMI_NAME" --description "$AMI_DESCRIPTION" --no-reboot

if [ $? -eq 0 ]; then
	printf "AMI request complete!\n"
fi
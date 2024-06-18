#!/bin/bash
component=$1
env=$2
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/BHarish07/expense-ansbile-roles-tf.git main.yaml -e component=$component e env=$env

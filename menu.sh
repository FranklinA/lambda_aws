#!/bin/bash
#######################################################
#Creating our function from the AWS CLI               #
#Be sure to change the ARN for the role piece.        #
#######################################################
echo ""
echo ""
echo "Input --> role arn:aws:iam::XXXXXXXXXX:role/hello-world-python-dev-us-east-1-lambdaRole "
read $lambda_exec_role_LA
echo "Input-> $lambda_exec_role_LA"
aws lambda create-function \
--function-name ECS \
--handler lambda_function.lambda_handler \
--memory-size 1024 \
--timeout 15 \
--runtime python3.6 \
--zip-file fileb://"$PWD"/ECS_Docker_Deploy/lambda_function.zip \
--role arn:aws:iam::XXXXXXXXXXXXXXX:role/hello-world-python-dev-us-east-1-lambdaRole \
--environment Variables="{NAME=secondcontainer,IMAGE=URI,TASK_DEF=linuxtaskdef,CLUSTER=linuxcluster,SERVICE=linuxservice}"

#!/bin/bash
echo File:$0 Args: $1 $2 $3 

USERNAME=$(aws --region=eu-west-1 ssm get-parameter --name "test-nuget-username" --with-decryption --output text --query Parameter.Value)
PASSWORD=$(aws --region=eu-west-1 ssm get-parameter --name "test-nuget-password" --with-decryption --output text --query Parameter.Value)
FEED_KEY=$(aws --region=eu-west-1 ssm get-parameter --name "test-nuget-feed-key" --with-decryption --output text --query Parameter.Value)
FEED_VALUE=$(aws --region=eu-west-1 ssm get-parameter --name "test-nuget-feed-value" --with-decryption --output text --query Parameter.Value)

> nuget.config

echo "<?xml version=\"1.0\" encoding=\"utf-8\"?><configuration><packageSources><add key=\"$FEED_KEY\" value=\"$FEED_VALUE\" /></packageSources><packageSourceCredentials><$FEED_KEY><add key=\"Username\" value=\"$USERNAME\" /><add key=\"ClearTextPassword\" value=\"$PASSWORD\" /></$FEED_KEY></packageSourceCredentials></configuration>" >> nuget.config

cat nuget.config

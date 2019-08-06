#!/bin/bash
echo File:$0 Args: $1 $2 $3 

> nuget.config

echo "<?xml version=\"1.0\" encoding=\"utf-8\"?><configuration><packageSources><add key=\"vsts\" value=\"$1\" /></packageSources><packageSourceCredentials><vsts><add key=\"Username\" value=\"$2\" /><add key=\"ClearTextPassword\" value=\"$3\" /></vsts></packageSourceCredentials></configuration>" >> nuget.config

cat nuget.config

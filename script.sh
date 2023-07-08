#!/bin/bash
command=$1
parameters="${@:2}"
echo "command: " $command # run
echo "parameters: " $parameters

echo "Running command: ./microsoft.security.devops.cli.${VERSION}/tools/guardian $command $parameters"
./microsoft.security.devops.cli.${VERSION}/tools/guardian init
./microsoft.security.devops.cli.${VERSION}/tools/guardian $command $parameters

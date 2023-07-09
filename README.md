# msdo

Docker container for Microsoft Security DevOps CLI

## Test image

``` PS
# build image using CMD, not ENTRYPOINT
# run container mapping external repository folder and results folder
docker run -it --rm -v /c/s/calculator:/app/calculator -v /c/Data/msdo/results:/app/calculator/.gdn/.r msdo:0.164.1 sh
```

``` PS
# inside the container, initialise guardian repository
./microsoft.security.devops.cli.0.164.1/tools/guardian init --working-directory /app/calculator
# run guardian against the mapped repository
./microsoft.security.devops.cli.0.164.1/tools/guardian run --working-directory /app/calculator --github --logger Console --logger-level Error --logger-show-level --auto --categories secrets
```
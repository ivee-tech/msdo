# Test Microsoft.Security.DevOps.Cli locally
$v='0.164.1'
Invoke-WebRequest -Uri https://www.nuget.org/api/v2/package/Microsoft.Security.DevOps.Cli/$v -OutFile microsoft.security.devops.cli.$v.nupkg
Expand-Archive -Path .\microsoft.security.devops.cli.$v.nupkg -Force
# & ./microsoft.security.devops.cli.$($v)/tools/guardian init

# Use the following command to build the image locally:
# versions: 0.164.1
$tag=$v
docker build -t msdo:${tag} --build-arg VERSION=${tag} -f Dockerfile.ubuntu .

# Tag the image and push to docker hub:

$tag='0.164.1'
$image='msdo'
$registry='docker.io'
$img="${image}:${tag}"
$ns='daradu' # namespace
docker tag ${img} ${registry}/${ns}/${img}
# requires docker login
docker push ${registry}/${ns}/${img}

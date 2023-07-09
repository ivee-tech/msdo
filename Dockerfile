# FROM ubuntu:20.04
FROM mcr.microsoft.com/dotnet/runtime:6.0

ARG VERSION
ENV VERSION ${VERSION}
# RUN apt-get -y update && apt-get -y install curl 

WORKDIR /app
# RUN curl https://www.nuget.org/api/v2/package/Microsoft.Security.DevOps.Cli/${VERSION} -o microsoft.security.devops.cli.${VERSION}.nupkg
# RUN mv microsoft.security.devops.cli.${VERSION}.nupkg microsoft.security.devops.cli.${VERSION}.zip 
# RUN unzip microsoft.security.devops.cli.${VERSION}.zip

COPY ./microsoft.security.devops.cli.${VERSION} ./microsoft.security.devops.cli.${VERSION}
COPY ./script.sh .
RUN chmod +x script.sh

CMD ["/bin/bash", "./script.sh"]

# ENTRYPOINT [ "/bin/bash", "./script.sh" ]

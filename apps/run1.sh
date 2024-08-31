#!/usr/bin/env bash
#!/usr/bin/env bash

#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.
# ASP.NET Core Web App
# dotnet new webapp --auth None -n Webapplication1 --language C#
# with Enable Docker and Configure for HTTPS options 

name=mywebapp
dotnet new webapp --auth None -n $name --language C# --framework net6.0
cd ./webapp/

cat > ./dockerfile << EOF

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
# docker inspect --format="{{json .Config.ExposedPorts }}" 0c2f17e032799a33680

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["$name.csproj", "$name/"]
RUN dotnet restore "$name/$name.csproj"
COPY . .
WORKDIR "/src/$name"
RUN dotnet build "$name.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
RUN dotnet publish "$name.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
# Workdir is  anyway /app without following command     
WORKDIR /app  
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "$name.dll"]
EOF

# build parent folder with sln
#docker build ..

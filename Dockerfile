FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /Main

# Copy csproj and restore as distinct layers
COPY Main/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY Main ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /Main
COPY --from=build-env /Main/out .
ENTRYPOINT ["dotnet", "Main.dll"]
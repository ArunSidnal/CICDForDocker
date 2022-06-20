FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["*", "./"]
RUN dotnet build "APIContainer.csproj" -c Release -o /app/build/service

FROM build as publish
RUN dotnet publish "APIContainer.csproj" -c Release -o /app/publish/service

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish/service .
ENTRYPOINT ["dotnet", "APIContainerAPI.dll"]

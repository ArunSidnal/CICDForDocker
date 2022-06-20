FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY [APIContainer.csproj,./]
RUN dotnet restore APIContainer.csproj
COPY . ./
RUN dotnet build -c Release -o /app/build/service

FROM build as publish
RUN dotnet publish -c Release -o /app/publish/service

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish/service .
ENTRYPOINT ["dotnet", "APIContainerAPI.dll"]

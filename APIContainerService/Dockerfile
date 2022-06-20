FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["./APIContainer.csproj", ""]
RUN dotnet restore "./APIContainer.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./APIContainer.csproj" -c Release -o /app/build

FROM build as publish
RUN dotnet publish "./APIContainer.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "APIContainerAPI.dll"]

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /src
COPY ["./APIContainerService/APIContainer.csproj", "./"]
RUN dotnet restore "./APIContainer.csproj"
COPY . .
RUN dotnet build "./APIContainer.csproj" -c Release -o /app/build

FROM build as publish
RUN dotnet publish "./APIContainer.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
CMD dotnet "APIContainerAPI.exe"

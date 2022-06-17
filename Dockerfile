 # syntax=docker/dockerfile:1
  FROM mcr.microsoft.com/dotnet/aspnet:5.0
  EXPOSE 8080
  COPY bin/Debug/netcoreapp3.1/ App/
  WORKDIR /App
  ENTRYPOINT ["dotnet", "APIContainer.dll"]

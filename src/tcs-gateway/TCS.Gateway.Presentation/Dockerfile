FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/tcs-gateway/TCS.Gateway.Presentation/TCS.Gateway.Presentation.csproj", "src/tcs-gateway/TCS.Gateway.Presentation/"]
COPY ../../../Directory.Packages.props .
COPY ../../../Directory.Build.props .
RUN dotnet restore "src/tcs-gateway/TCS.Gateway.Presentation/TCS.Gateway.Presentation.csproj"
COPY . .
WORKDIR "/src/src/tcs-gateway/TCS.Gateway.Presentation"
RUN dotnet build "TCS.Gateway.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "TCS.Gateway.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TCS.Gateway.Presentation.dll"]

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/tcs-trip/TCS.Trip.Presentation/TCS.Trip.Presentation.csproj", "src/tcs-trip/TCS.Trip.Presentation/"]
COPY ../../../Directory.Packages.props .
COPY ../../../Directory.Build.props .
RUN dotnet restore "src/tcs-trip/TCS.Trip.Presentation/TCS.Trip.Presentation.csproj"
COPY . .
WORKDIR "/src/src/tcs-trip/TCS.Trip.Presentation"
RUN dotnet build "TCS.Trip.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "TCS.Trip.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TCS.Trip.Presentation.dll"]

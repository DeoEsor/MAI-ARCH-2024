FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/tcs-user-facade/TCS.User.Facade.Presentation/TCS.User.Facade.Presentation.csproj", "src/tcs-user-facade/TCS.User.Facade.Presentation/"]
COPY ../../../Directory.Packages.props .
COPY ../../../Directory.Build.props .
RUN dotnet restore "src/tcs-user-facade/TCS.User.Facade.Presentation/TCS.User.Facade.Presentation.csproj"
COPY . .
WORKDIR "/src/src/tcs-user-facade/TCS.User.Facade.Presentation"
RUN dotnet build "TCS.User.Facade.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "TCS.User.Facade.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TCS.User.Facade.Presentation.dll"]

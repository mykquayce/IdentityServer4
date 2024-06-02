dotnet restore .\src\IdentityServer4\src\IdentityServer4.csproj --source https://api.nuget.org/v3/index.json
if (!$?) { return; }

dotnet build .\src\IdentityServer4\src\IdentityServer4.csproj --configuration Release --no-restore --verbosity minimal
if (!$?) { return; }

dotnet pack .\src\IdentityServer4\src\IdentityServer4.csproj --configuration Release --no-build --no-restore --nologo --output .\nupkg --runtime linux-x64 --verbosity minimal
if (!$?) { return; }

dotnet nuget push .\nupkg\*.nupkg --api-key ${env:NuGetServerApiKey} --skip-duplicate --source https://nuget

# flutter-cleanup.ps1
$projectRoot = Get-Location

$pathsToClean = @(
    "$projectRoot\.dart_tool",
    "$projectRoot\.packages",
    "$projectRoot\build",
    "$projectRoot\.gradle",
    "$env:USERPROFILE\.gradle\caches",
    "$env:USERPROFILE\.pub-cache\_temp",
    "$env:USERPROFILE\AppData\Local\Pub\Cache\_temp"
)

Write-Host "🧹 Cleaning up Flutter & Gradle cache..." -ForegroundColor Cyan

$freedSpace = 0
foreach ($path in $pathsToClean) {
    if (Test-Path $path) {
        $sizeBefore = (Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        Remove-Item -Recurse -Force -Path $path -ErrorAction SilentlyContinue
        $sizeMB = [math]::Round($sizeBefore / 1MB, 2)
        $freedSpace += $sizeMB
        Write-Host "✅ Removed $path ($sizeMB MB)"
    }
}

Write-Host "🎉 Total space freed: $freedSpace MB" -ForegroundColor Green
Write-Host "`nYou can now run: flutter clean && flutter pub get && flutter build apk" -ForegroundColor Yellow
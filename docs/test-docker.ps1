# PowerShell script to test Docker image build and deployment
# Run this from the docs directory after Docker Desktop is started

Write-Host "=== Testing Docker Image Build ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check if Docker is running
Write-Host "1. Checking Docker daemon..." -ForegroundColor Yellow
try {
    docker ps | Out-Null
    Write-Host "   ✓ Docker is running" -ForegroundColor Green
} catch {
    Write-Host "   ✗ Docker is not running. Please start Docker Desktop first." -ForegroundColor Red
    exit 1
}

# Step 2: Build the Docker image
Write-Host ""
Write-Host "2. Building Docker image..." -ForegroundColor Yellow
docker build -t jekyll-blog:test .
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ✗ Build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "   ✓ Image built successfully" -ForegroundColor Green

# Step 3: Run the container
Write-Host ""
Write-Host "3. Starting container..." -ForegroundColor Yellow
docker run -d -p 4000:4000 --name jekyll-test jekyll-blog:test
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ✗ Failed to start container!" -ForegroundColor Red
    exit 1
}
Write-Host "   ✓ Container started" -ForegroundColor Green

# Step 4: Wait for Jekyll to start
Write-Host ""
Write-Host "4. Waiting for Jekyll to start (this may take 10-20 seconds)..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

$maxAttempts = 15
$attempt = 0
$ready = $false

while ($attempt -lt $maxAttempts -and -not $ready) {
    $attempt++
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:4000" -TimeoutSec 2 -UseBasicParsing -ErrorAction SilentlyContinue
        if ($response.StatusCode -eq 200) {
            $ready = $true
            Write-Host "   ✓ Jekyll is ready!" -ForegroundColor Green
        }
    } catch {
        Write-Host "   Attempt $attempt/$maxAttempts..." -ForegroundColor Gray
        Start-Sleep -Seconds 2
    }
}

if (-not $ready) {
    Write-Host "   ⚠ Jekyll may not be ready yet. Check logs with: docker logs jekyll-test" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "=== Test Results ===" -ForegroundColor Cyan
    Write-Host "✓ Build: SUCCESS" -ForegroundColor Green
    Write-Host "✓ Container: RUNNING" -ForegroundColor Green
    Write-Host "✓ Site: ACCESSIBLE at http://localhost:4000" -ForegroundColor Green
    Write-Host ""
    Write-Host "View logs: docker logs jekyll-test" -ForegroundColor Gray
    Write-Host "Stop container: docker stop jekyll-test" -ForegroundColor Gray
    Write-Host "Remove container: docker rm jekyll-test" -ForegroundColor Gray
}


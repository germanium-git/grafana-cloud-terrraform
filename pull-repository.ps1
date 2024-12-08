# Set the path to your Git repository
# Replace "path-to-your-repo" with the actual path to your local Git repository
$repoPath = "."

# Navigate to the repository
Write-Host "Navigating to repository at: $repoPath" -ForegroundColor Cyan
Set-Location -Path $repoPath

# Verify the current directory is a Git repository
if (-Not (Test-Path "$repoPath\.git")) {
    Write-Host "Error: The specified directory is not a Git repository." -ForegroundColor Red
    return
}

# Fetch all branches and remote tracking references
Write-Host "`nFetching all branches and remote tracking references..." -ForegroundColor Yellow
git fetch --all

# List all remote branches
Write-Host "`nListing all remote branches..." -ForegroundColor Green
$remoteBranches = git branch -r | ForEach-Object { $_.Trim() }
$remoteBranches | ForEach-Object { Write-Host $_ }

# Iterate through all remote branches
foreach ($remoteBranch in $remoteBranches) {
    # Extract branch name (removing 'origin/' prefix)
    if ($remoteBranch -match "origin/(.+)") {
        $branchName = $Matches[1]

        Write-Host "`nChecking out branch: $branchName" -ForegroundColor Yellow

        # Check if the branch exists locally
        $localBranchExists = git branch --list $branchName | ForEach-Object { $_.Trim() }
        
        if (-not $localBranchExists) {
            # If the branch doesn't exist locally, create it and track the remote branch
            Write-Host "Branch $branchName does not exist locally. Creating and tracking it..." -ForegroundColor Cyan
            git checkout -b $branchName --track origin/$branchName
        } else {
            # If the branch exists locally, just check it out
            git checkout $branchName
        }

        # Pull the latest changes for the branch
        Write-Host "Pulling latest changes for branch: $branchName" -ForegroundColor Yellow
        git pull
    }
}

# Switch back to the default branch (e.g., main or master)
Write-Host "`nSwitching back to the default branch (main)..." -ForegroundColor Cyan
git checkout main

Write-Host "`nDone! All branches are up-to-date." -ForegroundColor Green

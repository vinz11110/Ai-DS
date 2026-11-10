@echo off
echo === Git Auto-Sync ===

echo.
echo [1/6] Stashing uncommitted local changes...
git stash

echo.
echo [2/6] Pulling latest changes from GitHub...
git pull origin main

echo.
echo [3/6] Restoring stashed changes...
git stash pop

echo.
echo [4/6] Ready to commit. 
set /p commit_msg="Enter your commit message (or press Enter for 'Auto update'): "
if "%commit_msg%"=="" set commit_msg=Auto update

echo.
echo [5/6] Staging all files...
git add .
git commit -m "%commit_msg%"

echo.
echo [6/6] Pushing to GitHub...
git push origin main

echo.
echo === Sync Complete ===
pause
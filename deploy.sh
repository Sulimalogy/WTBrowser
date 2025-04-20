#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
MASTER_BRANCH="master"
DEPLOY_BRANCH="deploy"
BUILD_DIR="build/web"

# Step 1: Commit changes to the master branch
echo "Switching to the $MASTER_BRANCH branch..."
git checkout $MASTER_BRANCH

echo "Adding changes to the staging area..."
git add .

echo "Committing changes..."
read -p "Enter commit message: " COMMIT_MESSAGE
git commit -m "$COMMIT_MESSAGE"

echo "Pushing changes to the $MASTER_BRANCH branch..."
git push origin $MASTER_BRANCH

# Step 2: Build the Flutter web app
echo "Building the Flutter web app..."
flutter build web

# Step 3: Deploy to the deploy branch
echo "Switching to the $DEPLOY_BRANCH branch..."
git checkout $DEPLOY_BRANCH || git checkout --orphan $DEPLOY_BRANCH

echo "Cleaning up old files..."
git rm -rf . || true

echo "Copying build files to the root of the deploy branch..."
cp -r $BUILD_DIR/* .

echo "Adding build files to the staging area..."
git add .

echo "Committing build files..."
git commit -m "Deploy build results"

echo "Pushing changes to the $DEPLOY_BRANCH branch..."
git push origin $DEPLOY_BRANCH

# Step 4: Switch back to the master branch
echo "Switching back to the $MASTER_BRANCH branch..."
git checkout $MASTER_BRANCH

echo "Deployment complete!"
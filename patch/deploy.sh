#!/bin/bash

# Set your GitHub credentials
username="hesh3am"
token="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"

cd vitrine
git checkout Testing

old_commit=$(git log -1 --pretty=format:"%h")
echo "old commit hash: $old_commit"

# Perform git pull with authentication
#git pull https://$username:$token@github.com/Heshamdev3/vitrine.git
git pull

new_commit=$(git log -1 --pretty=format:"%h")
echo "new commit hash: $new_commit"


# Prompt the user for commit hashes
#read -p "Enter the new commit hash: " new_commit
#read -p "Enter the old commit hash: " old_commit

# Copy changed files to the deployment directory
for file in $(git diff --name-only $old_commit $new_commit); do
  sudo cp $file /var/www/html/$file
done

echo "for add new changes to server "

cd /var/www/html
php artisan optimize:clear 
sudo php artisan config:cache
sudo php artisan config:clear
sudo php artisan cache:clear
#sudo apt-get install dos2unix
#dos2unix your_script.sh


echo "Deploy completed successfully."



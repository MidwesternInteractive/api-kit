#/bin/bash

echo What wold you like to name your project?

read project 

# go  back a level so we can create the project in valet directory
cd ../

# #Create a new laravel project
laravel new $project 

# go to project directory
cd $project

# #Install dependencies
composer require laravel/passport
composer require doctrine/dbal
composer require squizlabs/php_codesniffer --dev

# # Create the database
echo Laravel install complete ----------------------------------------

echo ---------------------------------------------------------

echo Create A Database ---------------------------------------

echo What wold you like the database name to be?

read dbname

mysql -u root -e "CREATE DATABASE $dbname"

echo Database set up, use $dbname with user root and no password

# #Replace some of the default info in the .env file
sed -i '' "s/DB_DATABASE=homestead/DB_DATABASE=$dbname/g" .env
sed -i '' "s/DB_USERNAME=homestead/DB_USERNAME=root/g" .env
sed -i '' "s/DB_PASSWORD=secret/DB_PASSWORD=/g" .env
sed -i '' "s/APP_NAME=Laravel/APP_NAME=$project/g" .env
sed -i '' "s#APP_URL=http://localhost#APP_URL=http://$project.dev#g" .env

# Migrate and install passport
php artisan migrate
php artisan passport:install

# Add passport info th Auth service provider and auth.php
cd ../$project

#AuthService Provider
cat /dev/null > $PWD/app/Providers/AuthServiceProvider.php
cat ../api-kit/src/AuthServiceProvider.php >> $PWD/app/Providers/AuthServiceProvider.php

#User.php
cat /dev/null > $PWD/app/User.php
cat ../api-kit/src/User.php >> $PWD/app/User.php

#auth.php
cat /dev/null > $PWD/config/auth.php
cat ../api-kit/src/auth.php >> $PWD/config/auth.php

## Local Environment
If you haven't already, make sure you have your local environment setup.

---

[Local Environment Setup](https://github.com/MidwesternInteractive/local-environment)

  - [Set Up](#set-up)
    - [Laravel Installer](#laravel-installer)
    - [Install Laravel Project](#install-laravel-project)
    - [Require composer dependencies](#require-composer-dependencies)
    - [Create MySQL DB](#create-mysql-db)
    - [Set up laravel .env](#set-up-laravel-env)
    - [Run MWI Install](#run-mwi-install)
  - [Testing](#testing)

# Set Up
__*Note*__ `$` represents a terminal command and should not be typed out.

All commands (unless otherwise specified) should be ran from home dir:
```shell
$ cd
```

## Laravel Installer
```shell
$ composer global require laravel/installer
```

## Install Laravel Project
```shell
$ cd ~/projects/
$ laravel new project-name
```
__*Note*__ to change `/projects/` to your project directory if different.

Use the name of the repository as the project name (replacing spaces and special characters), keep in mind that if your using `valet park` instead of `valet link` the project name will become a directory and default your local domain to "project-name.dev".

## Require composer dependencies
```shell
$ cd project-name
$ composer require mwi/api-kit
$ composer require squizlabs/php_codesniffer --dev
```

## Create MySQL DB
```shell
$ sh vendor/mwi/api-kit/database.sh
```

## Set up laravel .env
__*Note*__ if the .env file does not exist yet (just the .env.example exists) then run the following command first. Otherwise skip this step.
```shell
$ php artisan key:generate
```

Modify the following attributes in the .env file with the credentials for the project
```
APP_NAME="Project name"
APP_URL=http://project-name.dev

DB_DATABASE=databasename
DB_USERNAME=root
DB_PASSWORD=
```

Modify the following attributes in the .env file with the credentials for the project
```
ADMIN_EMAIL=client@projectdomain.com
```

## Run MWI Install
This is will set up the basic structure for a MWI Laravel project.
```shell
$ php artisan mwi:install
```

---

# Testing
We utilize PHP CodeSniffer and PHPUnit for testing our source code. PHP Unit comes out of box with Laravel and we installed Code Sniffer when we set up the project.

For ease of use we'll add some composer scripts to our `composer.json` file.
```json
"sniff": "phpcs -p ./app",
"sniff:fix": "phpcbf -p ./app",
"test": "phpunit",
"sniff:test": "composer sniff && phpunit",
```
The first just sniffs, second fixes the sniff errors it can, third runs phpunit tests and four sniffs and tests together.


## Local Environment
If you haven't already, make sure you have your local environment setup.

---

[Local Environment Setup](https://github.com/MidwesternInteractive/local-environment)


# Set Up __*Note*__ `$` represents a terminal command and should not be typed out.

All commands (unless otherwise specified) should be ran from home dir:
```shell
$ cd
```

## Laravel Installer
```shell
$ composer global require laravel/installer
```

## Install
clone this branch into your /projects/ folder where projects = the folder you parked valet on when you were setting up
your local env.

__*Note*__ to change `/projects/` to your project directory if different.

Use the name of the repository as the project name (replacing spaces and special characters), keep in mind that if your using `valet park` instead of `valet link` the project name will become a directory and default your local domain to "project-name.dev".

```shell
$ cd ~/projects/
$ git clone https://github.com/MidwesternInteractive/api-kit.git
$ cd api-kit
$ ./install.sh
# follow the prompts during the install
```
__*Note*__ if you get an error when you try to run the script, type:
```shell
$ chmod a+x install.sh
```
That will ensure the script is executable.

## That's all, folks! Passport is setup and ready to roll.

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

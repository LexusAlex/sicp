build:
	docker build -t sicp .
init:
	docker run --name sicp -d -it -v "$(PWD)":/sicp sicp /bin/bash
start:
	docker start php-tests
stop:
	docker stop php-tests
composer:
	 -c "composer update && chmod -R 777 vendor composer.lock"
composer-auto:
	docker exec -i php-tests /bin/bash -c "composer dump-autoload -o"
phpunit:
	docker exec -i php-tests /bin/bash -c "vendor/bin/phpunit"
php-run:
	docker exec -i php-tests /bin/bash -c "php index.php"
update:
	docker pull phpearth/php:7.3-cli
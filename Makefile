build:
	docker build -t sicp .
init:
	docker run --name sicp -d -it -v "$(PWD)":/sicp sicp /bin/bash
start:
	docker start sicp
stop:
	docker stop sicp
test-racket:
	docker exec -i sicp /bin/bash -c "raco test racket/$(p)"
phpunit:
	docker exec -i php-tests /bin/bash -c "vendor/bin/phpunit"
php-run:
	docker exec -i php-tests /bin/bash -c "php index.php"
update:
	docker pull phpearth/php:7.3-cli
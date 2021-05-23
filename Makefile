# Скачать обновления и собрать образы
build:
	docker-compose build --pull
# Запуск контейнеров
up:
	docker-compose up -d
# Остановить и удалить все контейнеры с префиксом sicp
down:
	docker-compose down --remove-orphans
# Остановка, удаление контейнеров и удаление томов
down-clear:
	docker-compose down -v --remove-orphans
# Перезапустить контейнеры
restart:
	docker-compose restart
# Удалить вообще все, что есть в системе
remove-all-system:
	docker system prune -a
# Запуск файла в sicp контейнере
test-racket:
	docker-compose run --rm sicp /bin/bash -c "raco test racket/$(p)"
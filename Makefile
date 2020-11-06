.PHONY: up down package

up:
	docker-compose up --build -d

down:
	docker-compose down

package:
	mvn clean
	mvn package
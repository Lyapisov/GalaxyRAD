.DEFAULT_GOAL := helpphp

help:
	@grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "[32m%-17s[0m %s\n", $$1, $$2}'
.PHONY: help

connect-php: ## Connect php
	docker-compose exec backend-app bash

connect-db: ## Connect db
	docker-compose exec db bash

initialize-locally: ## Initialize project locally
	cp -n .env.dist .env
	docker-compose pull
	docker-compose up --build -d
	docker-compose run --rm backend-app composer install

